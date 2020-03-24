# --------------------------- @properties ---------------------------
# t.references :winning_rule, index: true
# t.references :coupon, index: true
# t.timestamps
# --------------------------- ########### ---------------------------
class CouponsWinningRule < ActiveRecord::Base
  belongs_to :coupon
  belongs_to :winning_rule
end
