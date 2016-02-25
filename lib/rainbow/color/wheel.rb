require 'rainbow/color/harmony'

module Rainbow
  module Color
    module Wheel
      # Family name taken by splitting the wheel into 12 parts (seems common)
      # Red is 0 degrees so take 15 degrees either side as "Red" and then work
      # around the wheel in 30 degree segments
      # http://www.paintwithapassion.com/color-wheel-with-names/
      def family_name
        hue = self.to_lch.h.round # Hue in degrees
        case hue
        when 345..360, 0..14
          'Red'
        when 15..44
          'Red-Orange'
        when 45..74
          'Orange'
        when 75..104
          'Orange-Yellow'
        when 105..134
          'Yellow'
        when 135..164
          'Yellow-Green'
        when 165..194
          'Green'
        when 195..224
          'Blue-Green'
        when 225..254
          'Blue'
        when 255..284
          'Blue-Violet'
        when 285..314
          'Violet'
        when 315..344
          'Red-Violet'
        end
      end
      
      # Segements colors by hue in more segments, and not of equal length.  Intended
      # to better match the perceptual range of the human eye
      # http://www.workwithcolor.com/color-names-01.htm
      def perceptual_family_name
        hue = self.to_lch.h.round # Hue in degrees
        case hue
        when 11..20
          'Red-Orange'
        when 21..40
          'Orange-Brown'
        when 41..50
          'Orange-Yellow'
        when 51..60
          'Yellow'
        when 61..80
          'Yellow-Green'
        when 81.140
          'Green'
        when 141..169
          'Green-Cyan'
        when 170..200
          'Cyan'
        when 201..220
          'Cyan-Blue'
        when 221..240
          'Blue'
        when 241..280
          'Blue-Magenta'
        when 281..320
          'Magenta'
        when 321...330
          'Magenta-Pink'
        when 331..345
          'Pink'
        when 346..355
          'Pink-Red'
        when 356..360, 0..10
          'Red'
        end
      end
      
      # https://en.wikipedia.org/wiki/Complementary_colors
      # L*ch reputed to create a more perceptually accurate
      # complement
      def complement(space = :lch)
        harmonizer = Object.const_get("Rainbow::Color::Harmony::#{space.to_s.upcase}")
        complement = harmonizer.complement(self)
        complement.send converter_method(self)
      end
      
      def split_complement(space = :lch)
        harmonizer = Object.const_get("Rainbow::Color::Harmony::#{space.to_s.upcase}")
        complement = harmonizer.split_complement(self)
        [complement.first.send(converter_method(self)),
          complement.last.send(converter_method(self))]
      end
      
      def analogous(space = :lch)
        harmonizer = Object.const_get("Rainbow::Color::Harmony::#{space.to_s.upcase}")
        analogous = harmonizer.analogous(self)
        [analogous.first.send(converter_method(self)),
          analogous.last.send(converter_method(self))]
      end
      
      def triadic(space = :lch)
        harmonizer = Object.const_get("Rainbow::Color::Harmony::#{space.to_s.upcase}")
        triadic = harmonizer.triadic(self)
        [triadic.first.send(converter_method(self)),
          triadic.last.send(converter_method(self))]
      end
      
    private
      
      def converter_method(o)
        "to_#{o.class.name.split('::').last.downcase}"
      end
      
    end
  end
end