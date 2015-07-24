class RequestsController < ApplicationController
  before_action :set_user_request, only: [:edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]

  def index
    @requests = Request.includes(:from_language).all
  end

  def show
    @request = Request.includes(:from_language).friendly.find(params[:id])
  end

  def new
    @request = @current_user.requests.new
    @languages = Language.all
  end

  def edit
    @languages = Language.all
  end

  def create
    @request = @current_user.requests.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user_request
      @request = @current_user.requests.friendly.find(params[:id])
    end

    def request_params
      params.require(:request).permit(:name, :url, :description, :from_language_id, :to_language_id)
    end
end
