require "cpalette/version"

class Cpalette
  def get_hsl_values_decimal(color)

  end
  def get_color_codes_in_hex(h, s, l)

  end
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
  def self.rgb2hex(r, g, b)
    h1 = r.to_s(16).length == 2 ? r.to_s(16) : "0"+r.to_s(16)
    h2 = g.to_s(16).length == 2 ? g.to_s(16) : "0"+g.to_s(16)
    h3 = b.to_s(16).length == 2 ? b.to_s(16) : "0"+b.to_s(16)
    return "##{h1}#{h2}#{h3}"
  end
	def self.palette(size)
    color_palette = []
    hue_array = []
    hue = 359
    step_size = 360/size
    for i in 0..size-1
      hue_array.push(hue)
      hue = hue - step_size
    end
    hue_array.shuffle!
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
    return color_palette
  end
end
