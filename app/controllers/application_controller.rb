class ApplicationController < ActionController::Base
    before_action :authenticate_user!, unless: :devise_controller?

  private

  def current_team
    puts current_user.team
    @current_team ||= current_user.team if user_signed_in?
  end
  helper_method :current_team
end
