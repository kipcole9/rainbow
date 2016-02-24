require 'rainbow/color/harmony'

module Rainbow
  module Color
    module Wheel
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