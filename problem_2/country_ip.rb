require_relative 'lib/ip'
require_relative 'lib/ip_validator'
require_relative 'lib/ip_collection'
require_relative 'lib/csv_parser'

class CountryIp
  attr_reader :collection

  FILE_NAME  = 'IpToCountry.csv'
  SKIP_LINES = /^#/

  def initialize
    @collection = IpCollection.new
    parser.perform
  end

  def search(ip_string)
    ip = IpValidator.validate(ip_string)

    @collection.filter(ip).country
  end

  private

  def parser
    CsvParser.new do |par|
      par.collection = collection
      par.filename   = FILE_NAME
      par.skip_lines = SKIP_LINES
    end
  end
end

