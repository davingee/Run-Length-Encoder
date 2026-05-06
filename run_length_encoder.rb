#!/usr/bin/env ruby

class RunLengthEncoder
  def initialize(string = "")
    @data = string.to_s
  end

  def self.encode(string)
    new(string).encode
  end

  def self.decode(string)
    new(string).decode
  end

  def encode
    return "" if @data.empty?

    @data.each_char
         .slice_when { |prev, curr| prev != curr }
         .map { |group| "#{group.size}_#{group.first}" }
         .join
  end

  def decode
    return "" if @data.empty?

    @data.scan(/(\d+)_(.)/m).each_with_object("") do |(count, char), result|
      result << char * count.to_i
    end
  end
end

if __FILE__ == $0
  case ARGV[0]
  when "-e", "--encode"
    input = ARGV[1].to_s
    encoded = RunLengthEncoder.new(input).encode
    puts encoded
    ratio = input.empty? ? 0 : (1 - encoded.length / input.length.to_f) * 100
    warn "compression ratio #{format('%.2f', ratio)}%"
  when "-d", "--decode"
    puts RunLengthEncoder.new(ARGV[1]).decode
  else
    warn <<~USAGE
      Usage: #{File.basename($PROGRAM_NAME)} -e <string> | -d <encoded_string>
        -e, --encode    Encode the given string
        -d, --decode    Decode the given encoded string
    USAGE
    exit 1
  end
end
