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

    @boulder_best_os =  @logs.joins(:route).where('routes.category_id = ? and logs.status_id = ?', 1, 1).order(grade_id: 'DESC').order(sub_grade_id: 'DESC').order(date: 'DESC').first if @logs.exists?
    @boulder_best_fl =  @logs.joins(:route).where('routes.category_id = ? and logs.status_id = ?', 1, 2).order(grade_id: 'DESC').order(sub_grade_id: 'DESC').order(date: 'DESC').first if @logs.exists?
    @boulder_best_sent =  @logs.joins(:route).where('routes.category_id = ? and logs.status_id = ?', 1, 3).order(grade_id: 'DESC').order(sub_grade_id: 'DESC').order(date: 'DESC').first if @logs.exists?
    @boulder_best =  @logs.joins(:route).where('routes.category_id = ? and logs.status_id < ?', 1, 4).order(grade_id: 'DESC').order(sub_grade_id: 'DESC').order(date: 'DESC').first if @logs.exists?

    @lead_best_os =  @logs.joins(:route).where('routes.category_id = ? and logs.status_id = ?', 2, 1).order(grade_id: 'DESC').order(sub_grade_id: 'DESC').order(date: 'DESC').first if @logs.exists?
    @lead_best_fl =  @logs.joins(:route).where('routes.category_id = ? and logs.status_id = ?', 2, 2).order(grade_id: 'DESC').order(sub_grade_id: 'DESC').order(date: 'DESC').first if @logs.exists?
    @lead_best_rp =  @logs.joins(:route).where('routes.category_id = ? and logs.status_id = ?', 2, 3).order(grade_id: 'DESC').order(sub_grade_id: 'DESC').order(date: 'DESC').first if @logs.exists?
    @lead_best =  @logs.joins(:route).where('routes.category_id = ? and logs.status_id < ?', 2, 4).order(grade_id: 'DESC').order(sub_grade_id: 'DESC').order(date: 'DESC').first if @logs.exists?

    @od_boulder_best_os =  @od_logs.joins(:od_route).where('od_routes.category_id = ? and od_logs.status_id = ?', 1, 1).order(grade_id: 'DESC').order(sub_grade_id: 'DESC').order(date: 'DESC').first if @od_logs.exists?
    @od_boulder_best_fl =  @od_logs.joins(:od_route).where('od_routes.category_id = ? and od_logs.status_id = ?', 1, 2).order(grade_id: 'DESC').order(sub_grade_id: 'DESC').order(date: 'DESC').first if @od_logs.exists?
    @od_boulder_best_sent =  @od_logs.joins(:od_route).where('od_routes.category_id = ? and od_logs.status_id = ?', 1, 3).order(grade_id: 'DESC').order(sub_grade_id: 'DESC').order(date: 'DESC').first if @od_logs.exists?
    @od_boulder_best =  @od_logs.joins(:od_route).where('od_routes.category_id = ? and od_logs.status_id < ?', 1, 4).order(grade_id: 'DESC').order(sub_grade_id: 'DESC').order(date: 'DESC').first if @od_logs.exists?

    @od_lead_best_os = @od_logs.joins(:od_route).where('od_routes.category_id = ? and od_logs.status_id = ?', 2, 1).order(grade_id: 'DESC').order(sub_grade_id: 'DESC').order(date: 'DESC').first if @od_logs.exists?
    @od_lead_best_fl =  @od_logs.joins(:od_route).where('od_routes.category_id = ? and od_logs.status_id = ?', 2, 2).order(grade_id: 'DESC').order(sub_grade_id: 'DESC').order(date: 'DESC').first if @od_logs.exists?
    @od_lead_best_rp =  @od_logs.joins(:od_route).where('od_routes.category_id = ? and od_logs.status_id = ?', 2, 3).order(grade_id: 'DESC').order(sub_grade_id: 'DESC').order(date: 'DESC').first if @od_logs.exists?
    @od_lead_best =  @od_logs.joins(:od_route).where('od_routes.category_id = ? and od_logs.status_id < ?', 2, 4).order(grade_id: 'DESC').order(sub_grade_id: 'DESC').order(date: 'DESC').first if @od_logs.exists?

    @best_boulder_grade = [@boulder_best.grade.id, @od_boulder_best.grade.id].max
    @lowest_boulder_grade = [@boulder_best.grade.id, @od_boulder_best.grade.id].min

    @best_lead_grade = [@lead_best.grade.id, @od_lead_best.grade.id].max
    @lowest_lead_grade = [@lead_best.grade.id, @od_lead_best.grade.id].min
  end
end
