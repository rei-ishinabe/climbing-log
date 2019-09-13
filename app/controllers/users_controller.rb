class UsersController < ApplicationController

  def index
    if params[:from].nil?
      @from = [Log.all.order(date: 'ASC').first.date, OdLog.all.order(date: 'ASC').first.date].compact.min
    else
      @from = params[:from].to_date
    end

    if params[:to].nil?
      @to = Date.today
    else
      @to = params[:to].to_date
    end

    if current_user.admin
      @users = policy_scope(User).all.joins(:logs).where('logs.date BETWEEN ? AND ? AND logs.status_id < ?', @from, @to, 4).group('users.id').order('count(user_id) desc')
    else
      @users = policy_scope(User).all.joins(:logs).where('logs.date BETWEEN ? AND ? AND logs.status_id < ? AND is_public = ?', @from, @to, 4, true).group('users.id').order('count(user_id) desc')
    end
    authorize @users
  end

  def show
    @user = User.find(params[:id])
    authorize @user

    if params[:from].nil?
      if @user.logs.exists? && @user.od_logs.exists?
        @from = [@user.logs.order(date: 'ASC').first.date, @user.od_logs.order(date: 'ASC').first.date].min
      elsif @user.logs.exists?
        @from = @user.logs.order(date: 'ASC').first.date
      elsif @user.od_logs.exists?
        @from = @user.od_logs.order(date: 'ASC').first.date
      else
        @from = Date.today
      end
    else
      @from = params[:from].to_date
    end

    if params[:to].nil?
      @to = Date.today
    else
      @to = params[:to].to_date
    end

    @logs = Log.all.joins(:route).where('logs.date BETWEEN ? AND ? AND routes.user_id = ?', @from, @to, @user.id)
    @od_logs = OdLog.where('od_logs.date BETWEEN ? AND ? AND od_logs.user_id = ?', @from, @to, @user.id)

  end
end
