class Api::V1::PostsController < Api::V1::BaseController
  before_action :set_post, only: %i[comment claps]

  # GET /api/v1/posts
  def index
    pagy, posts = pagy(Post.includes(:group, comments: :user).where(group_id: params[:group_id]), page: params[:page], limit: params[:per_page])
    render_json_with_pagination(pagy, posts, PostSerializer)
  end

  # PATCH /api/v1/posts/:id/claps
  def claps
    if @post.increment!(:claps_count)
      respond_with_success("Created", :created)
    else
      respond_with_error(@post.errors.full_messages, :unprocessable_entity)
    end
  end

  # POST /api/v1/posts
  def create
    debugger
    post = Post.new(post_params)
    if post.save
      respond_with_success("Created", :created)
    else
      respond_with_error(post.errors.full_messages, :unprocessable_entity)
    end
  end

  # POST /api/v1/posts/:id/comment
  def comment
    comment = @post.comments.new(comment_params)
    if comment.save
      respond_with_success("Created", :created)
    else
      respond_with_error(comment.errors.full_messages, :unprocessable_entity)
    end
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])
    raise ActiveRecord::RecordNotFound unless @post
  end

  def comment_params
    params.fetch(:comment, {})
          .permit(:body, :user_id)
  end

  def post_params
    params.fetch(:post, {})
          .permit(:body, :group_id, :user_id)
  end
end
