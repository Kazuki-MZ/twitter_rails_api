# frozen_string_literal: true

module Api
  module V1
    module Auth
      class RegistrationsController < DeviseTokenAuth::RegistrationsController
        def create
          super do |resource|
            resource.build_profile(nickname: resource.name)
            resource.profile.save!
          end
        end

        private

        def sign_up_params
          params.permit(:email, :password, :password_confirmation, :name)
        end
      end
    end
  end
end
