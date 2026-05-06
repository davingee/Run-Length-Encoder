require_relative "run_length_encoder"

RSpec.describe RunLengthEncoder do
  let(:sample_text) { "zzzzzzzzzzzzzzzzzzzzz          wwwwwwwwwwwaaabbbbbbbbcdeeeeeeeeeeefff11111222333" }
  let(:encoded_text) { "21_z10_ 11_w3_a8_b1_c1_d11_e3_f5_13_23_3" }

  describe "#encode" do
    it "compresses repeating characters" do
      expect(RunLengthEncoder.new(sample_text).encode).to eq(encoded_text)
    end

    it "returns empty string for empty input" do
      expect(RunLengthEncoder.new("").encode).to eq("")
    end
  end

  describe "#decode" do
    it "decodes an encoded sequence" do
      expect(RunLengthEncoder.new(encoded_text).decode).to eq(sample_text)
    end

    it "returns empty string for empty input" do
      expect(RunLengthEncoder.new("").decode).to eq("")
    end

    it "handles underscore characters" do
      expect(RunLengthEncoder.new("3__2_a").decode).to eq("___aa")
    end
  end
end
