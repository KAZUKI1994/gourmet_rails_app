class CouponsController < ApplicationController
  before_action :set_coupon, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  before_action :admin_user, except: [:show]
  before_filter :form_components

  # GET /coupons
  # GET /coupons.json
  def index
    @coupons = Coupon.all
  end

  # GET /coupons/1
  # GET /coupons/1.json
  def show
  end

  # GET /coupons/new
  def new
    @coupon = Coupon.new
    @coupon.build_photo
  end

  # GET /coupons/1/edit
  def edit
  end

  # POST /coupons
  # POST /coupons.json
  def create
    @coupon = Coupon.new(coupon_params)

    respond_to do |format|
      if @coupon.save
        format.html { redirect_to @coupon, notice: 'Coupon was successfully created.' }
        format.json { render :show, status: :created, location: @coupon }
      else
        format.html { render :new }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupons/1
  # PATCH/PUT /coupons/1.json
  def update
    respond_to do |format|
      if @coupon.update(coupon_params)
        format.html { redirect_to @coupon, notice: 'Coupon was successfully updated.' }
        format.json { render :show, status: :ok, location: @coupon }
      else
        format.html { render :edit }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupons/1
  # DELETE /coupons/1.json
  def destroy
    @coupon.destroy
    respond_to do |format|
      format.html { redirect_to coupons_url, notice: 'Coupon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupon
      @coupon = Coupon.find(params[:id])
    end

    def form_components
      # to make restaurant information hash
      restaKey = Restaurant.all.pluck(:name)
      restaValue = Restaurant.all.pluck(:id)
      resta_ary = [restaKey,restaValue].transpose
      @restaurants = Hash[*resta_ary.flatten]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coupon_params
      params.require(:coupon).permit(:concept, :course, :price, :restaurant_id,
      photo_attributes: [:coupon_id, :images, :images_cache])
    end

    def admin_user
      if current_user.admin != 1
        redirect_to root_path, :alert => "このURLへのアクセスは許可されていません。"
      end
    end
end
