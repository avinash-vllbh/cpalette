# Cpalette

A simple color gem that returns you with a palette of colors which are web friendly and easy to use.

## Installation

Add this line to your application's Gemfile:

    gem 'cpalette'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cpalette

## Usage
  
  _Case 1:_

  Just pass in the number of colors you needs, returns you an array of 4 hashes with hsl, rgb and hex values for each color.

  ```ruby
	colors_array = Cpalette.palette(4)
	
 => [{"hsl"=>"359,62%,46%", "rgb"=>"190,45,47", "hex"=>"#be2d2f"}, {"hsl"=>"89,62%,80%", "rgb"=>"205,236,172", "hex"=>"#cdecac"}, {"hsl"=>"269,80%,71%", "rgb"=>"179,122,240", "hex"=>"#b37af0"}, {"hsl"=>"179,69%,79%", "rgb"=>"165,238,237", "hex"=>"#a5eeed"}]
 ```

 _Case 2:_

  You can pass an optional :hex => true, which return you an array containing only Hex values of required number of colors.

  ```ruby
  colors_array = Cpalette.palette(4, {:hex => true})

  => ["#37e1de", "#a468e3", "#f0383b", "#a5e660"]

  ```

## Contributing

1. Fork it ( https://github.com/avinash-vllbh/cpalette/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
