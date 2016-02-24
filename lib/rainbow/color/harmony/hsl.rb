module Rainbow
  module Color
    module Harmony
      class HSL
        def self.complement(color)
          hsl = color.to_hsl
          hue = (hsl.h + 0.5) % 1.0
          Color::HSL.new(hue, hsl.s, hsl.l)
        end
        
        # 150 degrees expressed as 150 / 360 = 0.41667
        def self.split_complement(color)
          hsl = color.to_hsl
          t1 = (hsl.h + 0.41667) % 1.0
          t2 = (hsl.h - 0.41667) % 1.0
          [Color::HSL.new(t1, hsl.s, hsl.l), Color::HSL.new(t2, hsl.s, hsl.l)]
        end
        
        # 30 degress expressed as 30 / 360 = 0.08333
        def self.analogous(color)
          hsl = color.to_hsl
          t1 = (hsl.h + 0.08333) % 1.0
          t2 = (hsl.h - 0.08333) % 1.0
          [Color::HSL.new(t1, hsl.s, hsl.l), Color::HSL.new(t2, hsl.s, hsl.l)]
        end
      
        # 120 degress expressed as 120 / 360 = 0.3333
        def self.triadic(color)
          hsl = color.to_hsl
          t1 = (hsl.h + 0.3333) % 1.0
          t2 = (hsl.h - 0.3333) % 1.0
          [Color::HSL.new(t1, hsl.s, hsl.l), Color::HSL.new(t2, hsl.s, hsl.l)]
        end
      end
    end
  end
end