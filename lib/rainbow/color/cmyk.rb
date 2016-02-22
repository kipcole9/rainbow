# https://en.wikipedia.org/wiki/Lab_color_space
module Rainbow
  module Color
    class CMYK
      include Color::Utilities
      attr_reader :c, :m, :y, :k
      
      def initialize(c, m, y, k, options = {})
        @c, @m, @y, @k  = c, m, y, k
      end
      
      def to_lab(options = {})
        self.to_srgb(options).to_lab(options)
      end
      
      def to_xyz(options = {})
        self.to_srgb(options).to_xyz(options)
      end
      
      def to_srgb(options = {})
        self.to_cmy(options).to_srgb(options)
      end
      
      def to_cmy(options = {})
        Color::CMY.new( 
          (c * (1 - k) + k), 
          (m * (1 - k) + k),
          (y * (1 - k) + k)
        )
      end
      
    private
    
      def normalize(t)
        t3 = t ** 3
        t3 > 0.008856 ? t3 : ((t - 16 / 116.0) / 7.787037)
      end
      
      
    end
  end
end
