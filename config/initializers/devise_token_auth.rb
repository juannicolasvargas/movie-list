# frozen_string_literal: true

DeviseTokenAuth.setup do |config|
  config.change_headers_on_each_request = false
  config.enable_standard_devise_support = true
  bypass_sign_in = false
end
