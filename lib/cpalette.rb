require "cpalette/version"

module Cpalette
  # Given Hue, Saturation and Lightness values return RGB values to it.
  # Function adopted from - http://easyrgb.com
  # Assumes inputs: h, s, l are in the range of [0,1]
  # Returns outputs: R, G, B valu in the range of [0,255]
  # E.g.
  # Inputs: h: 0.25, s: 0.89, l: 0.54
  # Output: r: 141, g: 242, b: 33
  def self.get_color_codes_in_rgb(h, s, l)
    if s == 0
      r = g = b = l * 255
    else
      if l < 0.5 
        y = l * (1.0 + s)
      else
        y = l + s - l * s
      end
      x = 2 * l - y
      r = (255 * hue2rgb(x, y, h + 1.0/3)).round(0)
      g = (255 * hue2rgb(x, y, h)).round(0)
      b = (255 * hue2rgb(x, y, h - 1.0/3)).round(0)
    end
    return "#{r},#{g},#{b}"
  end

  # Converts hue to rgb based on following conditions
  def self.hue2rgb(p,q,t)
    t = t + 1 if t < 0
    t = t -1 if t > 1
    if 6 * t < 1
      return p+(q-p)*6*t
    end
    if 2 * t < 1
      return q
    end
    if 3 * t < 2
      return p + (q - p) * ((2.0/3 - t) * 6)
    end
    return p
  end

  # Converts RGB to HEX code values
  # R, G, B are converted to string of base 16 and padded a 0 if length is less than 2
  # Assumes input r, g, b in the range of [0, 255]
  # Returns a HEX value
  # E.g Input - r: 255, g:255, b:255 => #FFFFFF
  # 
  def self.rgb2hex(r, g, b)
    h1 = r.to_s(16).length == 2 ? r.to_s(16) : "0"+r.to_s(16)
    h2 = g.to_s(16).length == 2 ? g.to_s(16) : "0"+g.to_s(16)
    h3 = b.to_s(16).length == 2 ? b.to_s(16) : "0"+b.to_s(16)
    return "##{h1}#{h2}#{h3}"
  end

  # Takes an input parameter of size (no of colors and options hash)
  # Returns equivalent number of random colors with HSL, RGB, HEX codes
  # Max possible values for Hue: 360, Saturation: 100, Lightness: 100
  # Saturation and Lightness values tend to determine the extremes of a color
  # Choosing a range of 60..90 tends to give optimum colors
	def self.palette(size, options = {})
    color_palette = []
    hue_array = []
    hue = 359
    size = size.to_i
    step_size = 360/size
    for i in 0..size-1
      hue_array.push(hue)
      hue = hue - step_size
    end
    hue_array.shuffle! #Inplace
    hue_array.each do |hue|
      s = Random.new.rand(60..90)
      l = Random.new.rand(40..80)
      color_codes = Hash.new
      color_codes["hsl"] = "#{hue},#{s}%,#{l}%"
      color_codes["rgb"] = get_color_codes_in_rgb(hue/360.0,s/100.0,l/100.0)
      rgb = color_codes["rgb"].split(",")
      color_codes["hex"] = rgb2hex(rgb[0].to_i, rgb[1].to_i, rgb[2].to_i)
      color_palette.push(color_codes) unless color_palette.include?(color_codes)
    end
    # If only hex option is set by user
    if options[:hex] != nil
      if options[:hex] == true
        cpalette = []
        color_palette.each do |color|
          cpalette.push(color["hex"])
        end
        color_palette = cpalette
      end
    end
    # binding.pry
    return color_palette
  end
end
