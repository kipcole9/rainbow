module Rainbow
  module Color
    class RGB
      include Color::Utilities
      include Color::Wheel
      
      attr_reader :r, :g, :b, :space
      
      def initialize(r, g, b, options = {})
        @r, @g, @b  = r, g, b
        @space      = Rainbow::Color::Spaces[options[:space].to_s]
        @linearized = options[:linearized]
      end
      
      def red
        r.round
      end
      
      def green
        g.round
      end
      
      def blue
        b.round
      end
      
      def to_s
        "rgb(#{red}, #{green}, #{blue})"
      end
      
      def whitepoint
        @whitepoint ||= space.whitepoint
      end
      
      def gamma
        @gamma ||= space.gamma
      end
      
      def to_xyz(options = {})
        linear_rgb = self.gamma_expand  
        m = linear_rgb.as_matrix
        s = space.to_xyz_matrix
        x = m[0,0] * s[0,0] + m[0,1] * s[0,1] + m[0,2] * s[0,2]
        y = m[0,0] * s[1,0] + m[0,1] * s[1,1] + m[0,2] * s[1,2]
        z = m[0,0] * s[2,0] + m[0,1] * s[2,1] + m[0,2] * s[2,2]
        Color::XYZ.new(x, y, z)
      end
      
      def to_lab(options = {})
        self.to_xyz(options).to_lab(options)
      end
      
      # http://stackoverflow.com/questions/2353211/hsl-to-rgb-color-conversion
      def to_hsl(options = {})
        var_r = r / 255.0
        var_g = g / 255.0
        var_b = b / 255.0
        
        min = [var_r, var_g, var_b].min
        max = [var_r, var_g, var_b].max
        h = s = l = (max + min) / 2.0
   
        if max == min
          h = s = 0.0
        else
          delta = max - min
          s = l > 0.5 ? (delta / (2.0 - max - min)) : (delta / (max + min))
          
          h = case max
            when var_r
              (var_g - var_b) / delta + (var_g < var_b ? 6.0 : 0.0)
            when var_g
              (var_b - var_r) / delta + 2
            when var_b
              (var_r - var_g) / delta + 4
          end
          h /= 6
        end          
        Color::HSL.new(h, s, l)
      end
      
      def to_cmy(options = {})
        Color::CMY.new(1 - (r / 255.0), 1 - (g / 255.0), 1 - (b / 255.0))
      end
      
      def to_cmyk(options = {})
        self.to_cmy(options).to_cmyk(options)
      end
      
      def to_lch(options = {})
        self.to_xyz(options).to_lab(options).to_lch(options)
      end
      
      def gamma_expand
        if @linearized
          self
        else
          self.class.new(expand_channel(r), expand_channel(g), expand_channel(b), 
            space: space.name, linearized: true)
        end
      end
      alias :linearize :gamma_expand
      alias :expand :gamma_expand
      
      def gamma_compress
        unless @linearized
          self
        else
          self.class.new(compress_channel(r), compress_channel(g), compress_channel(b), 
            space: space.name, linearized: false)
        end     
      end
      alias :gamma_correct :gamma_compress
      alias :compress :gamma_compress
      
      def as_matrix
        @matrix ||= Matrix.rows([[r.to_f / 255.0 * 100.0, g.to_f / 255.0 * 100.0, b.to_f / 255.0 * 100.0]])
      end
        
    private
    
      def expand_channel(c)
        (((c / 255.0) ** gamma) * 255.0).round
      end

      def compress_channel(c)
        (((c / 255.0) ** (1 / gamma)) * 255.0).round
      end

    end
  end
end