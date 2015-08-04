class RequestsController < ApplicationController
  before_action :set_user_request, only: [:edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]

  def index
    @options = allow_options [:from, :to, :by, :interested]
    @requests = Request.includes(:from_language)
    @requests = @requests.where(from_language: @options[:from]) if @options[:from].present?
    @requests = @requests.where(to_language: @options[:to]) if @options[:to].present?
    if @options[:by].present?
      user = User.friendly.find(@options[:by])
      @requests = @requests.where(user: user)
    end
    if @options[:interested].present?
      user = User.friendly.find(@options[:interested])
      @requests = @requests.interested_by user.id
    end
    if user_logged_in?
      @upvoted_requests = current_user.upvotes.collect(&:request).compact.uniq
    else
      @upvoted_requests = nil
    end
  end

  def show
    @request = Request.includes(:from_language, upvotes: :user).friendly.find(params[:id])
    @owner = @request.user
  end

  def new
    @request = current_user.requests.new
    @languages = Language.all
  end

  def edit
    @languages = Language.all
  end

  def create
    @request = current_user.requests.new(request_params)

    respond_to do |format|
      if @request.save
        @request.upvotes.create(user: current_user)
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

  def upvote
    @request = Request.friendly.find(params[:id])
    if upvoted = current_user.upvotes.where(request_id: Request.friendly.find(params[:id]).id) and upvoted.present?
      upvoted.destroy_all
      status_msg = "I too want this"
    else
      current_user.upvotes.create(request_id: Request.friendly.find(params[:id]).id)
      status_msg = "I don't want this"
    end
    render json: {status: status_msg, upvotes: @request.upvotes.count}
  end

  private
    def set_user_request
      @request = current_user.requests.friendly.find(params[:id])
    end

    def request_params
      params.require(:request).permit(:name, :url, :description, :from_language_id, :to_language_id)
    end

    def allow_options opts
      params.permit opts
    end
end
