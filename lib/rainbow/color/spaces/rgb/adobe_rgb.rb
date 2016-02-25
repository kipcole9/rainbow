module Rainbow
  module Color
    class AdobeRGB < RGB
      
      def initialize(r, g, b, options = {})
        super(r, g, b, options.merge(space: 'AdobeRGB'))
      end

      def to_adobe_rgb(options = {})
        self
      end
      alias :to_adobergb :to_adobe_rgb
      
    end
  end
end