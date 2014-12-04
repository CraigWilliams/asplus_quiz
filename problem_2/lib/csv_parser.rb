class CsvParser
  attr_writer :collection,
    :filename,
    :skip_lines

  def initialize
    yield self if block_given?
  end

  def perform
    File.open(@filename, 'r:iso-8859-1:utf-8') do |file|
      file.each_line do |line|
        next if line =~ @skip_lines
        @collection.add Ip.new(line)
      end
    end
  end
end
