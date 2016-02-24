# RGB values are 0 .. 255
module Rainbow
  module Color
    class SRGB < RGB
      # Although sRGB gamma is considered 2.2, thats an average only
      # an we use 2.4 for linearization
      GAMMA_CORRECTION_EXPONENT = 2.4
      
      def initialize(r, g, b, options = {})
        super(r, g, b, options.merge(space: :sRGB))
      end
      
      def to_srgb(options = {})
        self
      end
      
    private
    
      def expand_channel(x)
        c = x.to_f / 255.0
        e = if c <= 0.04045 
          c / 12.92
        else 
          ((c + 0.055) / 1.055) ** GAMMA_CORRECTION_EXPONENT
        end
        (e * 255.0).round
      end
      
      def compress_channel(x)
        c = x.to_f / 255.0
        e = if c <= 0.0031308
          c * 12.92
        else 
          1.055 * (c ** (1.0 / GAMMA_CORRECTION_EXPONENT)) - 0.055
        end
        (e * 255.0).round
      end
    end
  end
end
