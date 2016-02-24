module Rainbow
  module Color
    module Harmony
      class LCH
        def self.complement(color)
          lch = color.to_lch
          hue = (lch.h + 180) % 360
          Color::LCH.new(lch.l, lch.c, hue)
        end
        
        def self.split_complement(color)
          lch = color.to_lch
          t1 = (lch.h + 150) % 360
          t2 = (lch.h - 150) % 360
          [Color::LCH.new(lch.l, lch.c, t1), Color::LCH.new(lch.l, lch.c, t2)]
        end
      
        def self.analogous(color)
          lch = color.to_lch
          t1 = (lch.h + 30) % 360
          t2 = (lch.h - 30) % 360
          [Color::LCH.new(lch.l, lch.c, t1), Color::LCH.new(lch.l, lch.c, t2)]
        end
      
        def self.triadic(color)
          lch = color.to_lch
          t1 = (lch.h + 120) % 360
          t2 = (lch.h - 120) % 360
          [Color::LCH.new(lch.l, lch.c, t1), Color::LCH.new(lch.l, lch.c, t2)]
        end
      end
    end
  end
end