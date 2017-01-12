unless Rails.env.production?
  module Geocoder
    module Request
      def geocoder_spoofable_ip
        return "73.153.110.200"
      end
    end
  end
end

# Cache lat/long for each IP address
module Geocoder
  module Request
    def location
      @location ||= Rails.cache.fetch(geocoder_spoofable_ip, expire:24.hours) do
        Geocoder.search(geocoder_spoofable_ip, ip_address: true).first
      end
    end
  end
end
