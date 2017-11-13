class PostController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @title = params[:title]
    @content = params[:content]
    @user_id = session[:id]
    user = User.find_by(id: @user_id)
    Post.create(
      title: @title,
      content: @content,
      user_id: @user_id
    )
     redirect_to '/'
    end
   

  def show
    @id = params[:id]
    @post = Post.find(@id)
    
    @comments = @post.comments # Comment.all
   
  end
  
  def destroy
    @id = params[:id]
    @post = Post.find(@id)
    @post.destroy
    redirect_to '/'
  end
  
  def modify
    @id = params[:id]
    @title = params[:title]
    @content = params[:content]
    @post = Post.find(@id)
    @post.update(
      title: params[:title],
      content: params[:content]
      )
  end
  
  def update
      @id = params[:id]
      @post = Post.find(@id)
      
      @post.update(
        title: params[:title],
        content: params[:content]
        )
      redirect_to '/'
  end
  
  def create_comment
    @comment = params[:comment]
    Comment.create(
      content: @comment,
      post_id: params[:post_id]
      )
    redirect_to :back
  end

end
