module VendorsHelper
  def in_admin_context(&block)
    if current_vendor && current_vendor.admin?
      yield.html_safe
    end
  end

  def in_gaming_vendor_context(&block)
    if current_vendor && current_vendor.game_developer?
      yield.html_safe
    end
  end

  def in_coupon_vendor_context(&block)
    if current_vendor && current_vendor.coupon_provider?
      yield.html_safe
    end
  end

  def in_any_vendor_context(&block)
    if current_vendor.present?
      yield.html_safe
    end
  end

  def in_guest_context(&block)
    if current_vendor.blank?
      yield.html_safe
    end
  end

  def switch_to_environment_link
    if !environment_subdomain?
      if session[:crud_environment].to_sym == :live
        content_tag(:li) do
          link_to 'Switch to Test', vendors_environment_path(environment: 'test'), method: :patch
        end
      else
        content_tag(:li) do
          link_to 'Switch to Live', vendors_environment_path(environment: 'live'), method: :patch
        end
      end
    else
      if live_environment?
        content_tag(:li) do
          link_to 'Live', '#'
        end
      else
        content_tag(:li) do
          link_to 'Test', '#'
        end
      end
    end
  end
end
