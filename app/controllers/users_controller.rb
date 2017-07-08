class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_user, only: :index

  def index
    @users = User.all
    @posts = Post.order("updated_at DESC")
    @articles = Article.all
  end

  def show
    @user = User.find(params[:id])
  end

  def admin_user
    if current_user.admin != 1
      redirect_to root_path, :alert => "このURLへのアクセスは許可されていません。"
    end
  end
end
