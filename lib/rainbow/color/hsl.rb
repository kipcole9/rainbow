module Rainbow
  module Color
    class HSL
      include Color::Utilities
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
      
      def to_srgb(options = {})
        if s == 0
          r = g = b = (l * 255).round
        else
          var_2 = l < 0.5 ? l * (1 + s) : (l + s) - (s * l)
          var_1 = 2 * l - var_2
          r = (255 * hue_to_rgb(var_1, var_2, h + (1 / 3.0))).round
          g = (255 * hue_to_rgb(var_1, var_2, h)).round
          b = (255 * hue_to_rgb(var_1, var_2, h - (1 / 3.0))).round
        end
        Color::SRGB.new(r, g, b)
      end
      
      def to_hsl(options = {})
        self
      end

    private
      
      def hue_to_rgb(v1, v2, vh)
        vh += 1 if vh < 0
        vh -= 1 if vh > 1
        if 6 * vh < 1
          v1 + (v2 - v1) * 6 * vh
        elsif 2 * vh < 1
          v2
        elsif 2 * vh < 2
          v1 + (v2 - v1) * ((2 / 3.0) - vh) * 6
        else
          v1
        end
      end
    end
  end
end
