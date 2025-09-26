class FormsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_form, only: %i[ show edit update destroy ]

  def index
    @forms = Form.all
  end

  def show
  end

  def new
    @form = Form.new
  end

  def create
    @form = Form.new(form_params)
    if @form.save
      redirect_to @form, notice: "Form Created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @form.update(form_params)
      redirect_to @form, notice: "Form Updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @form.destroy
    redirect_to forms_path, notice: "Form Deleted!"
  end

  private

  def set_form
    @form = Form.find_by(id: params[:id])
    @fields = @form.fields.order(:created_at)
    redirect_to root_path,  warning: "can't find form with that id" if @form.nil?
  end

  def form_params
    params.expect(form: [ :name, :active, field_ids: [] ])
  end
end
