class UsersController < ApplicationController
  def index
    if current_user.admin
      @users = policy_scope(User).all.joins(:logs).group('users.id').order('count(user_id) desc')
    else
      @users = policy_scope(User).all.where('is_public = ?', true).joins(:logs).group('users.id').order('count(user_id) desc')
      raise
    end
    authorize @users
  end
end
