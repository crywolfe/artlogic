require_relative "../code_challenge"
require "spec_helper"


describe "Encoding" do

  it "should encode a decimal integer 0" do
    convert_raw_entry(0)
    make_2_bytes
    pack
    expect(make_encoded_hex).to eql("4000")
  end

  it "should encode a decimal integer -8192" do
    convert_raw_entry(-8192)
    make_2_bytes
    pack
    expect(make_encoded_hex).to eql("0000")
  end

  it "should encode a decimal integer 8191" do
    convert_raw_entry(8191)
    make_2_bytes
    pack
    expect(make_encoded_hex).to eql("7f7f")
  end

  it "should encode a decimal integer 2048" do
    convert_raw_entry(2048)
    make_2_bytes
    pack
    expect(make_encoded_hex).to eql("5000")
  end

  it "should encode a decimal integer -4096" do
    convert_raw_entry(-4096)
    make_2_bytes
    pack
    expect(make_encoded_hex).to eql("2000")
  end

end

describe "Decoding" do

  it "decodes the hex string '4000'" do
    expect(convert_hex('4000')).to eql(0)
  end

  it "decodes the hex string '0000'" do
    expect(convert_hex('0000')).to eql(-8192)
  end

  it "decodes the hex string '7f7f'" do
    expect(convert_hex('7f7f')).to eql(8191)
  end

  it "decodes the hex string '5000'" do
    expect(convert_hex('5000')).to eql(2048)
  end

  it "decodes the hex string '0a05'" do
    expect(convert_hex('0a05')).to eql(-6907)
  end

  it "decodes the hex string '5500'" do
    expect(convert_hex('5500')).to eql(2688)
  end
end
