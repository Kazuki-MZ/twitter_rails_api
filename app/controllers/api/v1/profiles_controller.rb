# frozen_string_literal: true

module Api
  module V1
    class ProfilesController < ApplicationController
      before_action :authenticate_api_v1_user!
      before_action :set_profile, only: [:update]

      def update
        if @profile.update(profile_params)
          render json: @profile
        else
          render json: @profile.errors, status: :unprocessable_entity
        end
      end

      private

      def set_profile
        @profile = Profile.find_by(user_id: current_api_v1_user.id)
      end

      def profile_params
        params.require(:profile).permit(:nickname, :bio, :location, :website, :date_of_birth, :icon, :header)
      end
    end
  end
end
