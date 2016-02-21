module Rainbow
  module Color
    class AdobeRGB < RGB
      
      def initialize(r, g, b, options = {})
        super(r, g, b, options.merge(space: 'AdobeRGB'))
      end
      
    end
  end
end