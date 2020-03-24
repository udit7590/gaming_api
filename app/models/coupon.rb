# --------------------------- @properties ---------------------------
# t.references :coupon_vendor
# t.string :code
# t.string :title
# t.string :company_name
# t.string :company_website
# t.string :availability # (Eg: Online|India|Delhi|Worldwide)
# t.text :details, limit: 2000
# t.text :conditions, limit: 1000
# t.integer :discount_amount
# t.decimal :discount_percentage
# t.integer :min_purchase
# t.datetime :valid_from
# t.datetime :valid_till
# t.boolean :one_time, default: true

# t.boolean :editable, default: true # Once false, cannot be changed
# t.boolean :active
# t.timestamps
# --------------------------- ########### ---------------------------
class Coupon < ActiveRecord::Base
  # TODO: after_commit on create, make it non-editable
  # TODO: prevent destroy if issued to someone or is associated with something
  # TODO_IMP: Generate code
end
