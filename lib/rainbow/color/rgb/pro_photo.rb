module Rainbow
  module Color
    class ProPhoto < RGB
      
      def initialize(r, g, b, options = {})
        super(r, g, b, options.merge(space: 'ProPhotoRGB'))
      end
      
    end
  end
end