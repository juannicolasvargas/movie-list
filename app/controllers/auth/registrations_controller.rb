module Auth
  class RegistrationsController < DeviseTokenAuth::RegistrationsController

    def render_create_success
      render json: current_user, status: :created
    end
  end
end
