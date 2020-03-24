# --------------------------- @properties ---------------------------
# t.references :gaming_vendor, index: true
# t.references :coupon, index: true
# t.string :type # For identifying different criterias
# t.string :name
# t.text :description, limit: 1500
# t.boolean :active

# # Criterias
# t.integer :level
# t.integer :points
# t.integer :given_rating
# t.integer :max_rating
# t.integer :times_played
# t.datetime :played_from # Can be used for festivities
# t.datetime :played_last
# t.integer :play_duration # In seconds
# t.decimal :percentage
# t.string :trophy
# t.string :realm
# # Criterias END
### TODO: Actually need max_value, achieve_value, achievement_string, played_from, played_last, play_duration

# t.timestamps
# --------------------------- ########### ---------------------------
class WinningRule < ActiveRecord::Base
  # TODO: Maybe make different rule classes
  self.inheritance_column = nil

  CRITERIAS = {
    points: 'Number of points scored',
    levels: 'Level achieved',
    percentage: 'Percentage of game completed',
    trophy: 'Trophy earned',
    realm: 'Realm entered',
    game_play_frequency: 'No of times game is played',
    game_play_duration: 'No of seconds game is played',
    rated: 'Rating given'
    # custom: 'Custom'
  }.freeze

  belongs_to :vendor, class_name: GamingVendor
  has_one :coupons_winning_rules, dependent: :destroy
  has_one :coupon, through: :coupons_winning_rules

  scope :active, -> { where(active: true) }
end
