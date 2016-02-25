module Rainbow
  module Color
    module Utilities
      def tristimulus(options = {})
        whitepoint = Color::Whitepoints[(options[:whitepoint] || :d65).to_s]
        observer = whitepoint.send("tristimulus_#{(options[:observer] || 2)}")
        observer
      end
      
      def degrees_to_radians(d)
        d / 180.0 * Math::PI
      end
      
      def self.hex_to_rgb(hex_string)
        hex = hex_string.delete('#')
        r = hex[0..1].to_i(16)
        g = hex[2..3].to_i(16)
        b = hex[4..5].to_i(16)
        [r, g, b]
      end

    end
  end
end