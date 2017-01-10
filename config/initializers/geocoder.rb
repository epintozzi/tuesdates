unless Rails.env.production?
  module Geocoder
    module Request
      def geocoder_spoofable_ip
        return "73.153.110.200"
      end
    end
  end
end
