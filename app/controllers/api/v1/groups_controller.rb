class Api::V1::GroupsController < Api::V1::BaseController
  # GET /api/v1/groups
  def index
    pagy, groups = pagy(Group.all, page: params[:page], limit: params[:per_page])
    render_json_with_pagination(pagy, groups, GroupSerializer)
  end
end
