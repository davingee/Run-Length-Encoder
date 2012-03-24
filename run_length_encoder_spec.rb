require "rspec"
require "mocha"
require "run_length_encoder"
  
describe RunLengthEncoder do  

  let :r_l_e do
    RunLengthEncoder.new("zzzzzzzzzzzzzzzzzzzzz          wwwwwwwwwwwaaabbbbbbbbcdeeeeeeeeeeefff11111222333")
  end
  let :r_l_d do
    RunLengthEncoder.new("21_z10_ 11_w3_a8_b1_c1_d11_e3_f5_13_23_3")
  end

  describe ".encode" do
    it "compresses all repeating sequences of letters" do
      r_l_e.encode.should == "21_z10_ 11_w3_a8_b1_c1_d11_e3_f5_13_23_3"
    end
  end
  
  describe ".decode" do
    it "should decode a encoded sequence" do
      r_l_d.decode.should == "zzzzzzzzzzzzzzzzzzzzz          wwwwwwwwwwwaaabbbbbbbbcdeeeeeeeeeeefff11111222333"
    end
  end

end
