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
      
      def complement
        lch = self.to_lch
        hue = (lch.h + 180) % 360
        Color::LCH.new(lch.l, lch.c, hue)
      end
      
      def split_complement
        lch = self.to_lch
        t1 = (lch.h + 150) % 360
        t2 = (lch.h - 150) % 360
        [Color::LCH.new(lch.l, lch.c, t1), Color::LCH.new(lch.l, lch.c, t2)]
      end
      
      def analogous
        lch = self.to_lch
        t1 = (lch.h + 30) % 360
        t2 = (lch.h - 30) % 360
        [Color::LCH.new(lch.l, lch.c, t1), Color::LCH.new(lch.l, lch.c, t2)]
      end
      
      def triadic
        lch = self.to_lch
        t1 = (lch.h + 120) % 360
        t2 = (lch.h - 120) % 360
        [Color::LCH.new(lch.l, lch.c, t1), Color::LCH.new(lch.l, lch.c, t2)]
      end
      
    end
  end
end