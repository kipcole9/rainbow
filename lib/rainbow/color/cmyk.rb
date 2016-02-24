# https://en.wikipedia.org/wiki/Lab_color_space
module Rainbow
  module Color
    class CMYK
      include Color::Utilities
      attr_reader :c, :m, :y, :k
      
      def initialize(c, m, y, k, options = {})
        @c, @m, @y, @k  = c, m, y, k
      end
      
      def to_s
        "CMYK(#{(c * 100).round}%, #{(m * 100).round}%, #{(y * 100).round}%, #{(k * 100).round}%)"
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

    end
  end
end
