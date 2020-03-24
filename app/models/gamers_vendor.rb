# --------------------------- @properties ---------------------------
# t.references :gamer,  index: true
# t.references :vendor, index: true
# t.timestamps
# --------------------------- ########### ---------------------------
class GamersVendor < ActiveRecord::Base
  belongs_to :gamer
  belongs_to :vendor
end
