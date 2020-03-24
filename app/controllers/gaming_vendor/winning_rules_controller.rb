class GamingVendor::WinningRulesController < GamingVendor::BaseController
  before_action :load_winning_rule, only: [:edit, :update, :show, :destroy]

  def index
    @winning_rules = current_vendor.winning_rules.active
  end

  def new
    initialize_winning_rule
  end

  def create
    @winning_rule = current_vendor.winning_rules.build(winning_rule_params)
    if @winning_rule.save
      redirect_to gaming_vendor_winning_rules_path, notice: 'A new winning rule has been created successfully'
    else
      render({ action: :new }, alert: @winning_rule.errors)
    end
  end

  def show
  end

  def edit
  end

  def update
    if @winning_rule.update(winning_rule_params)
      redirect_to gaming_vendor_winning_rules_path, notice: 'Winning rule has been edited successfully'
    else
      render({ action: :edit }, alert: @winning_rule.errors)
    end
  end

  def destroy
    if @winning_rule.update(winning_rule_params)
      redirect_to gaming_vendor_winning_rules_path, notice: 'Winning rule has been deleted successfully'
    else
      render({ action: :index }, alert: @winning_rule.errors.full_messages.to_sentence)
    end
  end

  private
    def initialize_winning_rule
      @winning_rule = current_vendor.winning_rules.build
    end

    def winning_rule_params
      params.require(:winning_rule).permit(:name, :description, :points, :level, :played_from, :played_till, :type,
                                            :given_rating, :max_rating, :active, :times_played, :play_duration,
                                            :percentage, :trophy, :realm
                                          )
    end

    def load_winning_rule
      @winning_rule = current_vendor.winning_rules.find(params[:id])
    end
end
