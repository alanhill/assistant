class ToDoController < ApplicationController
  include FriendlyDatetime
  before_action :set_to_do, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  def index
    if params[:limit].present?
      @to_dos = ToDo.all.order(created_at: :desc).limit(params[:limit])
    else
      @to_dos = ToDo.all.order(created_at: :desc).limit(10)
    end

    render 'to_do/index.json.jbuilder'
  end

  def show
    render json: @to_do
  end

  def create
    datetime = FriendlyDatetime.parse_date(to_do_params[:due])
    params[:due] = datetime

    @to_do = ToDo.new(to_do_params)
    respond_to do |format|
      if @to_do.save
        format.html { redirect_to @to_do, notice: 'ToDo was successfully created.' }
        format.json { render json: @to_do, status: :created, location: @to_do }
      else
        format.html { render :new }
        format.json { render json: @to_do.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    datetime = FriendlyDatetime.parse_date(to_do_params[:due])
    params[:due] = datetime

    respond_to do |format|
      if @to_do.update(to_do_params)
        format.html { redirect_to @to_do, notice: 'ToDo was successfully updated.' }
        format.json { render json: @to_do, status: :ok, location: @to_do }
      else
        format.html { render :edit }
        format.json { render json: @to_do.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @to_do.destroy
    respond_to do |format|
      format.html { redirect_to to_dos_url, notice: 'ToDo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_to_do
      @to_do = ToDo.find(params[:id])
    end

    def to_do_params
      params.require(:to_do).permit(:title, :description, :due)
    end
end
