module Pagination
  extend ActiveSupport::Concern

  included do
    before_action :validate_pagination_param
  end

  # checks the :page param and handles the edge cases if any
  # @return nil
  def validate_pagination_param
    params[:page] = Pagy::DEFAULT[:page] unless params.key?(:page)
    params[:per_page] = Pagy::DEFAULT[:limit] unless params.key?(:per_page)

    respond_with_error("Invalid page.") unless params[:page].to_i.positive?
    respond_with_error("Invalid per page.") unless params[:per_page].to_i.positive?
  end

  private
  # calls the rails `render json: [Hash]` with proper `meta_data` and serialized data
  # @param [ActiveRestClient::ResultIterator] resources
  # @param [ActiveModel::Serializer] serializer
  # @return nil
  def render_json_with_pagination(pagy, resources, serializer)
    respond_with_json(data(resources, serializer), meta_data(pagy))
  end

  # return an array containing the required meta data for pagination
  # @param [ActiveRestClient::ResultIterator] resources
  # @return [Hash] opts
  # @option opts [Integer] :current_page  current page
  # @option opts [Integer] :per_page of resources per page
  # @option opts [Integer] :total_entries total number of resources before pagination

  # calls map of each resource and responses with an array of serialized hashes
  # @param [ActiveRestClient::ResultIterator] resources
  # @param [ActiveModel::Serializer] serializer
  # @return [Array<Hash>]
  def data(resources, serializer)
    resources.map { |resource| serializer.new(resource) }
  end

  # return an array containing the required meta data for pagination
  # @return [Hash] opts
  # @option opts [Integer] :current_page  current page
  # @option opts [Integer] :per_page of resources per page
  # @option opts [Integer] :total_entries total number of resources before pagination
  def meta_data(pagy)
    {
      page: pagy.page,
      per_page: pagy.limit,
      total_entries: pagy.count
    }
  end
end
