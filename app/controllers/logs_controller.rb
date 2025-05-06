class LogsController < ApplicationController
  before_action :set_log, only: %i[ show edit update destroy ]

  def index
    @logs = Log.where(user: user)
  end

  def show
  end

  def new
    @log = Log.new
  end

  def create
    @log = Log.new(log_params)
    @log.user = user
    if @log.save
      redirect_to @log
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @log.update(log_params)
      redirect_to @log
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @log.destroy
    redirect_to logs_path
  end

  private

  def set_log
    @log = Log.find_by(id: params[:id], user: user)
    if @log.nil?
      flash.alert = "can't find log with that id"
      redirect_to root_url
    end
  end

  def log_params
    params.expect(log: [ :date, :trigger, :bad_thought, :emotion, :good_thought ])
  end
end
