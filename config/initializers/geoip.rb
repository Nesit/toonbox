require 'geoip'

GEO_IP = GeoIP.new(Rails.root.join('db', 'geoip', 'GeoIP.dat'))