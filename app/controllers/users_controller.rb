class UsersController < ApplicationController
  def index
    if current_user.admin
      @users = policy_scope(User).all.joins(:logs).group('users.id').order('count(user_id) desc')
    else
      @users = policy_scope(User).all.where('is_public = ?', true).joins(:logs).group('users.id').order('count(user_id) desc')
    end
    authorize @users
  end

  def show
    @user = User.find(params[:id])
    authorize @user

    @from = params[:from].to_date unless params[:from].nil?
    @to = params[:to].to_date unless params[:to].nil?
    unless @from.nil? | @to.nil?
      @logs = Log.all.joins(:route).where('logs.date BETWEEN ? AND ? AND routes.user_id = ?', @from, @to, @user.id)
    else
      @logs = Log.all.joins(:route).where('routes.user_id = ?', @user.id)
      if @logs.first.nil?
        @from = Date.today
      else
        @from = @logs.order(date: 'ASC').first.date
      end
      @to = Date.today
    end



  end
end
