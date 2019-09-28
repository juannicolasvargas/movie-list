module Auth
  class SessionsController < DeviseTokenAuth::SessionsController

    def render_create_success
      render json: current_user
    end
  end
end
