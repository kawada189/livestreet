class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @posts = Post.all 
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def new
    @post = Post.new # 新規投稿用の空のインスタンス
  end

  def create
    @post = Post.new(post_params)  # フォームから送られてきたデータ(body)をストロングパラメータを経由して@tweetに代入
    @post.user_id = current_user.id # user_idの情報はフォームからはきていないので、deviseのメソッドを使って「ログインしている自分のid」を代入
    @post.save
    redirect_to posts_path
  end

  def destroy
  end

  def update
  end

  private
  def post_params
    params.require(:post).permit(:title, :event_date, :start_time, :end_time, :contents) 
  end

end
