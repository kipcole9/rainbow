module Rainbow
  module Color
    class NTSC < RGB
      
      def initialize(r, g, b, options = {})
        super(r, g, b, options.merge(space: 'NTSC'))
      end
      
    end
  end
end