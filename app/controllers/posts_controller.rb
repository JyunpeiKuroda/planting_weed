class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(content: post_params[:text])
    if @post.save
      # 確認用success(いらなくなれば消す)
      redirect_to :action => "index", success: "投稿しました"
    else
      # 確認用flash(いらなくなれば消す)
      flash.now[:danger] = "投稿に失敗しました"
      render :action => "new"
    end
  end


  def index
    @posts = Post.all
  end
  def show
    @post = Post.find(params[:id])
  end



  def edit
    @post = Post.find(params[:id])
  end
  def update
  end


  def destroy
    if Post.find(params[:id]).destroy
      # 確認用flash(いらなくなれば消す)
      flash[:success] = "User deleted"
      redirect_to :action => "index", success: "削除しました"
    else
      # 確認用flash(いらなくなれば消す)
      flash.index[:danger] = "削除に失敗しました"
      render :action => "index"
    end
  end


  private
  def post_params
    params.permit(:text, :id)
  end
end
