class CitiesController < ApplicationController
  def index
    @city = City.all
    render :index
  end

  def show

    @post = Post.find(params[:id])
    @user = User.find(params[:id])
    @city = City.find(params[:id])
    @posts = City.find(params[:id]).posts
    @confirm_msg = "Are you sure you want to delete #{@post.title} ?"
    render :show
  end

  def posts
    @posts = City.find(params[:id]).posts
    @city = City.find(params[:id])
  end


  #   def create
  #   @post = .posts.build(cities_params)
  #   if @post.create
  #     redirect_to city_posts_path
  #   else
  #     redirect_to new_city_post_path
  #   end
  # end



end
