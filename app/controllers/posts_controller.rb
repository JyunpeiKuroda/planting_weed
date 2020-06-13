class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to :action => "index", success: "投稿しました"
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :action => "new"
    end
  end
  binding.pry


  def index
    binding.pry
    @post = Post.all
  end
  def show
    # @post = Tweet.find(params[:id])
  end


  def edit
  end
  def update
  end


  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end


end
