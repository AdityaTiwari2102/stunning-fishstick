class Api::V1::BaseController < ApplicationController
  include Pagy::Backend
  include ApiResponders
  include ApiExceptions
  include Pagination
end
