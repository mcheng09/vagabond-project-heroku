class PostsController < ApplicationController

  def index
    @posts = Post.all
    @city = City.find_by_id(params[:city_id])
    render :index
  end

  def new
    @post = Post.new
    @city = City.find_by_id(params[:city_id])
    render :new
  end

  def create

    post_params = params[:post]
    post = Post.new({title: post_params[:title], description: post_params[:description]})
    # @post = current_user.posts.build(params[:city_id])
    if post.save
    city = City.find(params[:city_id])
    city.posts << post
    current_user.posts << post
      if city.save && current_user.save
        flash[:notice] = "Post created!"

      redirect_to city_path(city.id)
      else
        flash[:error] = post.errors.full_messages.join("-----")
       redirect_to new_city_post_path
      end
    else
      flash[:error] = post.errors.full_messages.join("-----")
      redirect_to new_city_post_path
    end

  end


  def show
    @post = Post.find(params[:id])
    @city = @post.city_id
    @first_name = @post.user.first_name
    @confirm_msg = "Are you sure you want to delete #{@post.title} ?"
    render :show
  end



  def edit
    @post = Post.find(params[:id])
    authorize! :manage, @post
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    authorize! :manage, @post
    @post.update(post_params)
    redirect_to "/posts/#{@post.id}"
  end



  def destroy
    @post = Post.find(params[:id])
    authorize! :manage, @post
    city = City.find(params[:city_id])
    @post.destroy
    flash[:notice] = "'#{@post.title}' post was deleted"
    redirect_to city_path(city.id)
  end


  private

  def post_params
    params.require(:post).permit(:title, :description)
  end

end
