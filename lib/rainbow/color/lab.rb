# https://en.wikipedia.org/wiki/Lab_color_space
module Rainbow
  module Color
    class Lab
      include Color::Utilities
      attr_reader :l, :a, :b
      
      def initialize(l, a, b, options = {})
        @l, @a, @b  = l, a, b
      end
      
      def to_xyz(options = {})
        y2 = ((l + 16) / 116.0)
        y = normalize(y2)
        x = normalize(a / 500.0 + y2)
        z = normalize(y2 - b / 200.0)
        
        Color::XYZ.new(
          x * tristimulus(options).x, 
          y * tristimulus(options).y, 
          z * tristimulus(options).z
        )
      end
      
      def to_lch(options = {})
        h = Math::atan2(b, a)
        h = h > 0 ? (h / Math::PI) * 180 : 360 - (h.abs / Math::PI) * 180
        c = Math.sqrt(a ** 2 + b ** 2)
        Color::Lch.new(l, c, h)
      end
      
      def to_srgb(options = {})
        self.to_xyz(options).to_srgb(options)
      end
      
    private
    
      def normalize(t)
        t3 = t ** 3
        t3 > 0.008856 ? t3 : ((t - 16 / 116.0) / 7.787037)
      end
      
    end
  end
end
