class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

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
      @users = policy_scope(User).all
      authorize @users
      users_hash = {}
      @users.each do |user|
        users_hash[user] = 0
        users_hash[user] += user.logs.where('logs.date BETWEEN ? AND ? AND logs.status_id < ?', @from, @to, 4).count
        users_hash[user] += user.od_logs.where('od_logs.date BETWEEN ? AND ? AND od_logs.status_id < ?', @from, @to, 4).count
      end
      @users = []
      users_hash.sort_by{ |_, v| -v }.each do |item|
        if item[1] > 0
          @users << item[0]
        end
      end
      @users
    else
      @users = policy_scope(User).where('is_public= ?', true)
      authorize @users
      users_hash = {}
      @users.each do |user|
        users_hash[user] = 0
        users_hash[user] += user.logs.where('logs.date BETWEEN ? AND ? AND logs.status_id < ?', @from, @to, 4).count
        users_hash[user] += user.od_logs.where('od_logs.date BETWEEN ? AND ? AND od_logs.status_id < ?', @from, @to, 4).count
      end
      @users = []
      users_hash.sort_by{ |_, v| -v }.each do |item|
        if item[1] > 0
          @users << item[0]
        end
      end
      @users
    end

  end

  def show
    @user = User.find_by(hash_string: params[:id])
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
