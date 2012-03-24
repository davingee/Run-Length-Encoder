#!/usr/bin/env ruby

class RunLengthEncoder

   def initialize(string)
     @data = string
   end

   def encode
     result = ''
     count = 0
     last_char = nil
     @data.split(//).each do |char|
       last_char ||= char
       if last_char == char
         count += 1
       else
         result << "#{count}_#{last_char}"
         last_char = char
         count = 1
       end
     end
     result << "#{count}_#{last_char}"
     result
   end

   def decode
     result = ''
     @data.scan(/(\d+_)(\w{1}|\s)/).each do |count, character|
       result << character * count.gsub("_", "").to_i
     end
     result
   end

end

# test = 'zzzzzzzzzzzzzzzzzzzzz          wwwwwwwwwwwaaabbbbbbbbcdeeeeeeeeeeefff11111222333'
# # puts test
# 
# encoded = RunLengthEncoder.new(test).encode
# puts ("encoded sequence = #{encoded}")
# 
# decoded = RunLengthEncoder.new(encoded).decode
# puts ("decoded sequence = #{decoded}")
# 
# puts "compression ratio #{(1 - encoded.length / decoded.length.to_f) * 100}%"

# RunLengthEncoder.new.encode
# "mississippi".split( // ).sort.join.gsub(/(.)\1{2,}/) { |s| s.length.to_s + s[0,1] }

# run_length_encoder.rb -e 'zzzzzzzzzzzzzzzzzzzzz          wwwwwwwwwwwaaabbbbbbbbcdeeeeeeeeeeefff11111222333'
if ARGV[0] == '-e' 
  encoded = RunLengthEncoder.new(ARGV[1]).encode
  puts ("encoded sequence = #{encoded}")
  puts "compression ratio #{(1 - encoded.length / ARGV[1].length.to_f) * 100}%"
end

# run_length_encoder.rb -d 6_a5_b4_c
if ARGV[0] == '-d'
  decoded = RunLengthEncoder.new(ARGV[1]).decode
  puts ("decoded sequence = #{decoded}")
end

