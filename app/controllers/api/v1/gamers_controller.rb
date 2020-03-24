class Api::V1::GamersController < Api::V1::BaseController
  before_action :load_gamer, only: [:index, :update, :destroy], if: -> { action_name.downcase != 'index' || params[:id].present? }

  # Handles gamer creation
  # GET /api/v1/gamers
  # { 
      # name  : <name>,
      # email : <email>,
      # phone : <phone>
  # }
  def create
    @gamer = Gamer.new(permitted_params_for_gamer)
    if @gamer.save
      rendor_api_success_message('Gamer created', @gamer.to_json, 200)
    else
      rendor_api_error_message(@gamer.errors, 400)
    end
  end

  # Handles both show and index
  # GET /api/v1/gamers
  # { id: <gamer_id> | null }
  def index
    if params[:id].present?
      # SHOW
    else
      # INDEX
    end
  end

  # PUT /api/v1/gamers
  # { id: <gamer_id>, ... }
  def update
  end

  # DELETE /api/v1/gamers
  # { id: <gamer_id> }
  def destroy
  end

  private
    def load_gamer
      @gamer = Gamer.find(params[:id])
    end

    def permitted_params_for_gamer
      params.permit(:name, :email, :phone)
    end
end
