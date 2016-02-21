module Rainbow
  module Color
    class PAL < RGB
      
      def initialize(r, g, b, options = {})
        super(r, g, b, options.merge(space: 'PAL'))
      end
      
    end
    
    SECAM = PAL
  end
end