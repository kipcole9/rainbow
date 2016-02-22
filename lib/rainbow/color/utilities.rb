module Rainbow
  module Color
    module Utilities
      def tristimulus(options = {})
        whitepoint = Color::Whitepoints[(options[:whitepoint] || :d65).to_s]
        observer = whitepoint.send("tristimulus_#{(options[:observer] || 2)}")
        observer
      end
      
      def degrees_to_radians(d)
        d / 180.0 * Math::PI
      end
    end
  end
end