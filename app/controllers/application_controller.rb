class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_timezone
  
  include SessionsHelper
  include CalendarHelper

  private

    def set_timezone
     min = request.cookies["time_zone"].to_i
     Time.zone = ActiveSupport::TimeZone[-min.minutes]
    end

end
