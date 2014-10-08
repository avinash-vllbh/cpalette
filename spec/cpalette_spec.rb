require 'spec_helper'

describe Cpalette do
  describe "#get_color_codes_in_rgb" do
    let(:output) {"117,240,240"}
    it 'returns RGB values for given HSL values' do
      expect(Cpalette.get_color_codes_in_rgb(0.5, 0.8, 0.7)).to eq(output)
    end
    it 'handles case when saturation is 0' do
      expect(Cpalette.get_color_codes_in_rgb(0.5, 0, 1)).to eq("255,255,255")
    end
  end
  describe "#rgb2hex" do
    let(:output) {"#ffffff"}
    it 'returns RGB values for given HSL values' do
      expect(Cpalette.rgb2hex(255, 255, 255)).to eq(output)
    end
  end
  describe "#palette" do
    it 'gives all three types of color codes' do
      expect(Cpalette.palette(4)).to be_truthy
    end
    it 'returns only hex values when options[:hex] is true' do
      expect(Cpalette.palette(4, {:hex => true})).to be_truthy
    end
  end
end