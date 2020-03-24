class Api::V1::AchievementsController < Api::V1::BaseController
  # POST /api/v1/achievements
  # { gamer_id: <gamer_id>, winning_rule_id: <id> }
  def create
  end

  # POST /api/v1/achievements
  # { gamer_id: <gamer_id> }
  # Shows all achievements of the gamer passed.
  def index
  end

  # DELETE /api/v1/gamers
  # { id: <gamer_id> }
  def destroy
  end
end
