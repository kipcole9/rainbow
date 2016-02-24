# HSL values are 0..1
module Rainbow
  module Color
    class HSL
      include Color::Utilities
      include Color::Wheel
      
      attr_reader :h, :s, :l
      
      def initialize(h, s, l, options = {})
        @h, @s, @l =  h, s, l
      end
      
      def hue
        @hue ||= (h * 360).round
      end
      
      def saturation
        @saturation ||= (s * 100).round
      end
      
      def lightness
        @lightness ||= (l * 100).round
      end
      
      def to_s
        "hsl(#{hue}, #{saturation}%, #{lightness}%)"
      end
      
      def to_lab(options = {})
        self.to_srgb(options).to_lab(options)
      end
      
      def to_xyz(options = {})
        self.to_srgb(options).to_xyz(options)
      end
      
      # http://stackoverflow.com/questions/2353211/hsl-to-rgb-color-conversion
      def to_srgb(options = {})
        if s == 0
          r = g = b = l
        else
          var_2 = l < 0.5 ? (l * (s + 1)) : (l + s - (l * s))
          var_1 = l * 2.0 - var_2

          r = hue_to_rgb(var_1, var_2, h + (1 / 3.0))
          g = hue_to_rgb(var_1, var_2, h)
          b = hue_to_rgb(var_1, var_2, h - (1 / 3.0))
        end
        Color::SRGB.new((r * 255).round, (g * 255).round, (b * 255).round)
      end
      
      def to_hsl(options = {})
        self
      end

    private
      
      def hue_to_rgb(v1, v2, vh)
        vh += 1.0 if vh < 0.0
        vh -= 1.0 if vh > 1.0
        
        if vh < (1.0 / 6.0)
          v1 + (v2 - v1) * 6.0 * vh
        elsif vh < (1.0 / 2.0)
          v2
        elsif vh < (2.0 / 3.0)
          v1 + (v2 - v1) * ((2.0 / 3.0) - vh) * 6.0
        else
          v1
        end
      end
    end
  end
end
