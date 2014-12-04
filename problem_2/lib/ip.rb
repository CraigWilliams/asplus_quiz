class Ip
  attr_reader :country

  def initialize(row)
    @row = row.gsub(/\"/, '').chomp
    parse
  end

  def contain?(ip)
    ip.between?(@start, @end)
  end

  private

  def parse
    data     = @row.split(',')
    @start   = data[0].to_i
    @end     = data[1].to_i
    @country = data[6]
  end
end

