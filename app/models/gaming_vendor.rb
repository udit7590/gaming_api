# 1. Can create winning rules
# 2. Can view API
# 3. Can generate API Key
# 4. TODO: Can reach out for support
# 5. TODO: Can see usage
# 6. Can change profile info
# 7. Can view account info (Email, status, last login, last updated)
# 8. TODO: Usage stats
class GamingVendor < Vendor
  API_KEYS = [:test_api_normal_key, :test_api_privileged_key, :live_api_normal_key, :live_api_privileged_key].freeze

  has_many :winning_rules, dependent: :destroy
  before_save :generate_api_keys, if: :any_key_blank?

  def any_key_blank?
    API_KEYS.map do |key|
      send(key).blank?
    end.any?
  end

  def regenerate_key(key_name)
    return generate_api_keys(true) if key_name.to_s.strip.downcase == 'all'
    return false if API_KEYS.include?(key_name)
    update(key_name => SecureRandom.hex)
    send(key_name)
  end
  private

    def generate_api_keys(force = false)
      self.test_api_normal_key      = SecureRandom.hex if (test_api_normal_key.blank? || force)
      self.test_api_privileged_key  = SecureRandom.hex if (test_api_privileged_key.blank? || force)
      self.live_api_normal_key      = SecureRandom.hex if (live_api_normal_key.blank? || force)
      self.live_api_privileged_key  = SecureRandom.hex if (live_api_privileged_key.blank? || force)
      save if force
      true
    end
end
