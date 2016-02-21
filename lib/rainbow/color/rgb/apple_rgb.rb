module Rainbow
  module Color
    class AppleRGB < RGB
      
      def initialize(r, g, b, options = {})
        super(r, g, b, options.merge(space: 'AppleRGB'))
      end
      
    end
  end
end