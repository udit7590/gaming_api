class CouponVendor::CouponsController < CouponVendor::BaseController
  before_action :load_coupon, only: [:edit, :update, :show, :destroy]

  def index
    @coupons = current_vendor.coupons
  end

  def new
    initialize_coupon
  end

  def create
    @coupon = current_vendor.coupons.build(coupon_params)
    if @coupon.save
      redirect_to coupon_vendor_coupons_path, notice: 'A new coupon has been created successfully'
    else
      render({ action: :new }, alert: @coupon.errors)
    end
  end

  def show
  end

  def edit
  end

  def update
    if @coupon.update(coupon_params)
      redirect_to coupon_vendor_coupons_path, notice: 'Coupon has been edited successfully'
    else
      render({ action: :edit }, alert: @coupon.errors)
    end
  end

  def destroy
    if @coupon.update(coupon_params)
      redirect_to coupon_vendor_coupons_path, notice: 'Coupon has been deleted successfully'
    else
      render({ action: :index }, alert: @coupon.errors.full_messages.to_sentence)
    end
  end

  private
    def initialize_coupon
      @coupon = current_vendor.coupons.build
    end

    def coupon_params
      params.require(:coupon).permit(:code, :title, :company_name, :valid_from, :valid_till, :company_website,
                                            :availability, :details, :conditions, :discount_amount, :discount_percentage,
                                            :min_purchase, :one_time
                                          )
    end

    def load_coupon
      @coupon = current_vendor.coupons.find(params[:id])
    end
end
