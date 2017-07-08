class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_banner, only: [:aniversary, :firstdate, :onesidelove, :confession]
  before_action :authenticate_user!, :except=>[:index, :show, :aniversary, :firstdate, :onesidelove, :confession, :new, :create ]
  before_filter :form_components
  # GET /posts
  # GET /posts.json
  def index
    @posts= Post.all
  end
  def aniversary
    @posts = Post.joins(:hashtag).where(hashtags: {:aniversary => "#記念日"})
    @heading = "記念日・誕生日にオススメ"
    render "index"
  end
  def firstdate
    @posts = Post.joins(:hashtag).where(hashtags: {:firstdate => "#初デート"})
    @heading = "初めてのデートなら"
    render "index"
  end
  def onesidelove
    @posts = Post.joins(:hashtag).where(hashtags: {:onesidelove => "#片思い"})
    @heading = "気になるあの子と"
    render "index"
  end
  def confession
    @posts = Post.joins(:hashtag).where(hashtags: {:confession => "#告白"})
    @heading = "告白の大一番"
    render "index"
  end
  

  # GET /posts/1
  # GET /posts/1.json
  def show
    @restaurant = @post.restaurant
  end

  def search
      @posts =Post.where('content LIKE(?)', "%#{params[:keyword]}%").limit(10)
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.build_hashtag
    @post.build_restaurant
    10.times{ @post.photos.build }
    line ='----------------------'
  end


  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: '記事投稿ありがとうございました。こちらが投稿していただいた記事です。' }
        format.json { render :show, status: :created, location: @post }
        logger.debug(@post)
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: '変更は正常に保存されました。' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: '投稿は正常に削除されました。' }
      format.json { head :no_content }
    end

    

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
      @restaurant = Restaurant.where(id: @post_restaurant)
    end

    def set_banner
      if Banner.first
        @showban = Banner.where( 'id >= ?', rand(Banner.first.id..Banner.last.id) ).first
        @showban2 = Banner.where( 'id >= ?', rand(Banner.first.id..Banner.last.id) ).first
      end
    end

    def form_components
      # to make restaurant information hash
      restaKey = Restaurant.all.pluck(:name)
      restaValue = Restaurant.all.pluck(:id)
      resta_ary = [restaKey,restaValue].transpose
      @restaurants = Hash[*resta_ary.flatten]
      @price_zone = {"¥0 ~ ¥999" => 500, "¥1000 ~ ¥1999" => 1500, "¥2000 ~ ¥2999" => 2500, "¥3000 ~ ¥3999" => 3500, "¥4000 ~ ¥4999" => 4500, "¥5000 ~ ¥5999" => 5500, "¥6000 ~ ¥6999" => 6500, "¥7000 ~ ¥7999" => 7500, "¥8000 ~ ¥8999" => 8500, "¥9000 ~ " => 9500}
      @grades = [["1年生","1年生"], ["2年生","2年生"],["3年生","3年生"],["4年生","4年生"],["院1年生","院1年生"],["院2年生","院2年生"],["院3年生","院3年生"]]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:titile, :user_id, :restaurant_id, :content, :time_zone, :amount, :total_eval, :quality_eval, :service_eval, :atomos_eval, :drink_eval, :partner_eval, :visit_date, :url,
        :author_name, :author_faculty, :author_college, :author_grade, :author_gender, :relation,
        hashtag_attributes: [:post_id, :surprise, :firstdate, :onesidelove, :confession, :lunch, :cafe, :dinner, :aniversary, :xmas, :valentine, :whiteday, :birthday],
        photos_attributes: [:post_id, :images, :images_cache],
        restaurants_attributes: [:name, :area, :address, :telnumber, :url]
      )
    end
end
