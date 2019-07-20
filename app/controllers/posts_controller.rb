class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @posts = Post.search(params[:search]).order(id: "DESC")
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def new
    @post = Post.new 
  end

  def create
    @post = Post.new(post_params)  
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def destroy
  end

  def update
  end



  private
  def post_params
    params.require(:post).permit(:title, :event_at, :start_time, :end_time, :contents, :skill_list, :interest_list,:place,:genre,:image,:picture) 
  end

end
