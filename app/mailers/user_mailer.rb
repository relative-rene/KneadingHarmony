class UserMailer < ApplicationMailer
  after_action :set_delivery_options,
               :prtimeslot_delivery_to_guests,
               :set_business_headers
  def receive(email)
     page = Page.find_by(address: email.to.first)
     page.emails.create(
       subject: email.subject,
       body: email.body
     )

     if email.has_attachments?
       email.attachments.each do |attachment|
         page.attachments.create({
           file: attachment,
           description: email.subject
         })
       end
     end
  def feedback_message(business, user)
    @business = business
    @user = user
    mail
  end

  def campaign_message(business, user)
    @business = business
    @user = user
  end

  private

    def set_delivery_options
      # You have access to the mail instance,
      # @business and @user instance variables here
      if @business && @business.has_smtp_settings?
        mail.delivery_method.settings.merge!(@business.smtp_settings)
      end
    end

    def prtimeslot_delivery_to_guests
      if @user && @user.guest?
        mail.perform_deliveries = false
      end
    end

    def set_business_headers
      if @business
        headers["X-SMTPAPI-CATEGORY"] = @business.code
      end
    end
  end
end
