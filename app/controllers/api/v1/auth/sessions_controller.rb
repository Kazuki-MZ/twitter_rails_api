# frozen_string_literal: true

module Api
  module V1
    module Auth
      class SessionsController < ApplicationController
        def index
          if current_api_v1_user
            render json: { current_user: current_api_v1_user.as_json(include: { profile: { methods: :icon_image_url } }) }
          else
            render json: { message: 'No such current_user' }
          end
        end
      end
    end
  end
end
