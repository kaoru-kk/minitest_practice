class BlogsController < ApplicationController
  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to user_path(1)
    else
      render :new, notice: 'もう一回試してみてください'
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:user_id, :title, :body)
  end
end
