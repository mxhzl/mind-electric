class LogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_log, only: %i[ show edit update destroy ]
  before_action :set_form, only: %i[ new create edit update ]

  def index
    @logs = Log.where(user: current_user).order(date: :desc)
  end

  def show
  end

  def new
    @log = Log.new
  end

  def create
    @log = Log.new(log_params.first)
    @log.form = @form
    @log.user = current_user
    if @log.save
      create_responses(log_params.last)
      redirect_to @log, notice: "Log Created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @log.update(log_params.first)
      update_responses(log_params.last)
      redirect_to @log, notice: "Log Updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @log.destroy
    redirect_to logs_path, notice: "Log Deleted"
  end

  private

  def set_log
    @log = Log.find_by(id: params[:id], user: current_user)
    redirect_to root_path,  warning: "can't find log with that id" if @log.nil?
  end

  def set_form
    @form = Form.find_by(id: params[:form_id])
    redirect_to root_path,  warning: "can't find form with that id" if @form.nil?
  end

  def log_params
    params.expect(log: [ :date ], field: @form.fields.pluck(:key).map { |f| f.to_sym })
  end

  def create_responses(field_params)
    @form.fields.each do |field|
      response = Response.new
      response.text = field_params[field.key]
      response.log = @log
      response.field = field
      response.save
    end
  end

  def update_responses(field_params)
    @log.responses.each do |r|
      r.update(text: field_params[r.field.key])
    end
  end
end
