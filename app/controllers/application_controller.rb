class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden, content_type: 'text/html' }
        format.html { redirect_to main_app.root_url, alert: exception.message }
      end
    end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
