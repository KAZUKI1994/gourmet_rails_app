class RestaurantsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :set_banner
  # GET /restaurants
  # GET /restaurants.json
  def index
    #@restaurants = Restaurant.all
    @restaurants = Restaurant.order("created_at DESC").page(params[:page])

    respond_to do |format|
      format.html
      format.json{render json: @restaurants}
    end
  end

  # エリア別一覧ページ
  def umeda
    @restaurants = Restaurant.where(area: "梅田・北新地").page(params[:page])
    @heading = "梅田・北新地"
    render "list"
  end

  def koube
    @restaurants = Restaurant.where(area: "三宮・元町").page(params[:page])
    @heading = "三宮・元町"
    render "list"
  end

  def kyoto
    @restaurants = Restaurant.where(area: "四条・河原町").page(params[:page])
    @heading = "四条・河原町"
    render "list"
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    client = Instagram.client(:access_token => "3071852877.7c40aca.8b384e3e656e4e77a67147b9136aaf01")
    @users = client.user_recent_media("3071852877", {:count => 4})
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
    3.times{ @restaurant.photos.build }
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: '店情報は正常に保存されました。' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: '変更は正常に保存されました。' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: '店情報は正常に削除されました。' }
      format.json { head :no_content }
    end

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end
    def set_banner
      if Banner.first
        @showban = Banner.where( 'id >= ?', rand(Banner.first.id..Banner.last.id) ).first
        @showban2 = Banner.where( 'id >= ?', rand(Banner.first.id..Banner.last.id) ).first
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :telnumber, :url, :area,  photos_attributes: [:restaurant_id, :images, :images_cache], posts_attributes: [:content])
    end
end
