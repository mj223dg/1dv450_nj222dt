class Api::V1::BaseController < ApplicationController
    include Knock::Authenticable
    protect_from_forgery with: :null_session
    before_action :authenticate
    before_action :restrict_access
    respond_to :json
    def restrict_access
      api_key = request.headers['Api-Key']
      @api = Api.where(api_key: api_key).first if api_key
      unless @api
        render json: { errors: { developer_error: "The API-key is invalid or outdated", user_error: "Something went wrong" } }, status: :unauthorized
      end
    end
end
