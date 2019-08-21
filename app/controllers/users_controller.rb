class UsersController < ApplicationController
  def index
    if current_user.admin
      @users = policy_scope(User).all
    else
      @users = policy_scope(User).all.where('is_public = ?', true)
    end
  end
end
