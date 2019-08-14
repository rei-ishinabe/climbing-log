class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about, :terms]

  def home
    if user_signed_in?
      @routes = policy_scope(Route).where('user_id = ?', current_user.id)
    end
  end
end
