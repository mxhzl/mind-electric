class FieldsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_field, only: %i[ show edit update destroy ]

  def index
    @fields = Field.all.order(:created_at)
  end

  def show
  end

  def new
    @field = Field.new
  end

  def create
    @field = Field.new(field_params)
    if @field.save
      redirect_to @field, notice: "Field Created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @field.update(field_params)
      redirect_to @field, notice: "Field Updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @field.destroy
    redirect_to fields_path, notice: "Field Deleted!"
  end

  private

  def set_field
    @field = Field.find_by(id: params[:id])
    redirect_to root_path,  warning: "can't find field with that id" if @field.nil?
  end

  def field_params
    params.expect(field: [ :prompt, :help_text, form_ids: [] ])
  end
end
