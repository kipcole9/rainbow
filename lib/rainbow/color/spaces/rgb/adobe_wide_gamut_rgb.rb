module Rainbow
  module Color
    class AdobeWideGamut < RGB
      
      def initialize(r, g, b, options = {})
        super(r, g, b, options.merge(space: 'AdobeWideGamutRGB'))
      end
      
    end
  end
end