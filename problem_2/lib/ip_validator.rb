require 'ipaddr'

class IpValidator

  def self.validate(ip_string)
    begin
      IPAddr.new(ip_string).to_i
    rescue IPAddr::InvalidAddressError
      raise ArgumentError
    end
  end
end
