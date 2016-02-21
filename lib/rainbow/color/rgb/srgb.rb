module Rainbow
  module Color
    class SRGB < RGB
      # Although sRGB gamma is considered 2.2, thats an average only
      # an we use 2.4 for linearization
      GAMMA_CORRECTION_EXPONENT = 2.4
      
      def initialize(r, g, b, options = {})
        super(r, g, b, options.merge(space: :sRGB))
      end
      
    private
    
      def expand_channel(c)
        if c <= 0.04045 
          c / 12.92
        else 
          ((c + 0.055) / 1.055) ** GAMMA_CORRECTION_EXPONENT
        end
      end
      
      def compress_channel(c)
        if c <= 0.0031308
          c * 12.92
        else 
          1.055 * (c ** (1.0 / GAMMA_CORRECTION_EXPONENT)) - 0.055
        end
      end
    end
  end
end
