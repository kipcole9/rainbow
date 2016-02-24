# l is 1..100; c is 1..10, h is 0..360
module Rainbow
  module Color
    class LCH
      include Color::Utilities
      attr_reader :l, :c, :h
      
      def initialize(l, c, h, options = {})
        @l, @c, @h  = l, c, h
      end
      
      def luminance
        @luminace ||= l.round
      end
      
      def chroma
        @chroma ||= c.round
      end
      
      def hue
        @hue ||= h.round
      end
      
      def to_s
        "L*CH(#{luminance}%, #{chroma}%, #{hue})"
      end
      
      def to_lab(options = {})
        a = Math.cos(degrees_to_radians(h)) * c
        b = Math.sin(degrees_to_radians(h)) * c
        Color::LAB.new(l, a, b)
      end
      
      def to_xyz(options = {})
        self.to_lab(options).to_xyz(options)
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
