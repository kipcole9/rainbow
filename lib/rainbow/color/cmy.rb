# https://en.wikipedia.org/wiki/Lab_color_space
module Rainbow
  module Color
    class CMY
      include Color::Utilities
      attr_reader :c, :m, :y
      
      def initialize(c, m, y, options = {})
        @c, @m, @y  = c, m, y
      end
      
      def to_s
        "CMYK(#{(c * 100).round}%, #{(m * 100).round}%, #{(y * 100).round}%)"
      end
      
      def to_lab(options = {})
        self.to_srgb(options).to_lab(options)
      end
      
      def to_xyz(options = {})
        self.to_srgb(options).to_xyz(options)
      end
      
      def to_srgb(options = {})
        Color::SRGB.new(( 1 - c ) * 255, ( 1 - m ) * 255, ( 1 - y ) * 255)
      end
      
      def to_cmyk(options = {})
        k = 1
        k = c if c < k
        k = m if m < k
        k = y if y < k
        if k == 1
          c2 = m2 = y2 = 0
        else
          c2 = (c - k) / (1.0 - k)
          m2 = (m - k) / (1.0 - k)
          y2 = (y - k) / (1.0 - k)
        end
        
        Color::CMYK.new(c2, m2, y2, k)
      end
      
    private
    
      def normalize(t)
        t3 = t ** 3
        t3 > 0.008856 ? t3 : ((t - 16 / 116.0) / 7.787037)
      end
      
      
    end
  end
end
