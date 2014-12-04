class IpCollection

  def initialize
    @collection = []
  end

  def add(item)
    @collection << item
  end

  def filter(ip)
    @collection.select do |item|
      item.contain?(ip)
    end.first
  end
end
