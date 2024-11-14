class Api::V1::UsersController < Api::V1::BaseController
  # GET /api/v1/users
  def index
    pagy, users = pagy(User.all, page: params[:page], limit: params[:per_page])
    render_json_with_pagination(pagy, users, UserSerializer)
  end
end
