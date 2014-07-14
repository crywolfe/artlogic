require_relative "../code_challenge"
require "spec_helper"

describe "Encoding" do

   it "should encode a decimal integer 0" do
       convertRawEntry(0)
       make2Bytes
       pack
       expect(makeEncodedHex).to eql("4000")
   end

   it "should encode a decimal integer -8192" do
    convertRawEntry(-8192)
    make2Bytes
    pack
    expect(makeEncodedHex).to eql("0000")
   end

   it "should encode a decimal integer 8191" do
      convertRawEntry(8191)
      make2Bytes
      pack
      expect(makeEncodedHex).to eql("7f7f")
   end

   it "should encode a decimal integer 2048" do
      convertRawEntry(2048)
      make2Bytes
      pack
      expect(makeEncodedHex).to eql("5000")
   end

   it "should encode a decimal integer -4096" do
      convertRawEntry(-4096)
      make2Bytes
      pack
      expect(makeEncodedHex).to eql("2000")
   end

end

describe "Decoding" do

   it "decodes the hex string '4000'" do
      expect(convertHex('4000')).to eql(0)
   end

   it "decodes the hex string '0000'" do
      expect(convertHex('0000')).to eql(-8192)
   end

   it "decodes the hex string '7f7f'" do
      expect(convertHex('7f7f')).to eql(8191)
   end

   it "decodes the hex string '5000'" do
      expect(convertHex('5000')).to eql(2048)
   end

   it "decodes the hex string '0a05'" do
      expect(convertHex('0a05')).to eql(-6907)
   end

   it "decodes the hex string '5500'" do
      expect(convertHex('5500')).to eql(2688)
   end
end
