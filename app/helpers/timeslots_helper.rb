module TimeslotsHelper
    def check_admin?
        @user = User.find_by_id(params[:id])
        return @user if @user[:admin] == 7531
    end
end
