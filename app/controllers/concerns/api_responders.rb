module ApiResponders
  extend ActiveSupport::Concern

  private

  def respond_with_error(message, status = :unprocessable_entity, context = {})
    render status: status, json: { success: false, message: message }.merge(context)
  end

  def respond_with_success(message, status = :ok, context = {})
    render status: status, json: { success: true, message: message }.merge(context)
  end

  def respond_with_json(data, metadata, status = :ok, errors = [])
    render status: status, json: construct_json(data, metadata, errors)
  end

  def construct_json(data, metadata, errors)
    {
      data: data || nil,
      metadata: metadata || {},
      errors: errors || nil
    }
  end
end
