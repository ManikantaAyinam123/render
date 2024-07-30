class PostsController < ApplicationController

  # GET /posts or /posts.json
  def index
    @posts = Post.all
    render json: @posts
  end

  # GET /posts/1 or /posts/1.json
  def show
    render json: @post
  end

  # GET /posts/new
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # GET /posts/1/edit
  def edit
    render json: @post
  end

  # POST /posts or /posts.json
  

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    if @post.update(post_params)
      render json: @post, status: :ok, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    head :no_content
  end

  private
   
    # Only allow a list of trusted parameters through.
    def post_params
     
      params.permit(:title, :body)
    end
end
