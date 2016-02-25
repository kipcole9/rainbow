module Rainbow
  module Color
    class XYZ
      include Color::Utilities
      attr_reader :x, :y, :z, :space
      
      def initialize(x, y, z, options = {})
        @x, @y, @z  = x, y, z
        @space      = Rainbow::Color::Spaces['XYZ']
      end
      
      def to_s
        "XYZ(#{x.round(4)}, #{y.round(4)}, #{z.round(4)})"
      end
      
      def whitepoint
        @whitepoint ||= space.whitepoint
      end
      
      def gamma
        @gamma ||= space.gamma
      end
      
      def to_srgb(options = {})
        r, g, b = matrix_mult(xyz_matrix, Rainbow::Color::Spaces['sRGB'].from_xyz_matrix)
        Color::SRGB.new(
          [(r * 255.0).round, 0].max,
          [(g * 255.0).round, 0].max,
          [(b * 255.0).round, 0].max, 
          linearized: true).gamma_compress
      end
      
      def to_adobe_rgb(options = {})
        r, g, b = matrix_mult(xyz_matrix, Rainbow::Color::Spaces['AdobeRGB'].from_xyz_matrix)
        Color::AdobeRGB.new(          
          [(r * 255.0).round, 0].max, 
          [(g * 255.0).round, 0].max, 
          [(b * 255.0).round, 0].max,  
          linearized: true).gamma_compress
      end
      alias :to_adobergb :to_adobe_rgb
      
      def to_lab(options = {})
        x2 = normalize_for_lab(x / tristimulus(options).x) 
        y2 = normalize_for_lab(y / tristimulus(options).y)
        z2 = normalize_for_lab(z / tristimulus(options).z)
        
        l = (116.0 * y2) - 16.0
        a = 500.0 * (x2 - y2)
        b = 200.0 * (y2 - z2)
        
        Color::LAB.new(l, a, b)
      end
      
    private
      def matrix_mult(m, s)
        r = m[0,0] * s[0,0] + m[0,1] * s[0,1] + m[0,2] * s[0,2]
        g = m[0,0] * s[1,0] + m[0,1] * s[1,1] + m[0,2] * s[1,2]
        b = m[0,0] * s[2,0] + m[0,1] * s[2,1] + m[0,2] * s[2,2]
        return r, g, b
      end
      
      def xyz_matrix
        @matrix ||= Matrix.rows([[x / 100.0, y / 100.0, z / 100.0]])
      end
      
      def normalize_for_lab(c)
        c > 0.008856 ? (c ** ( 1.0 / 3.0)) : ((7.787 * c) + (16.0 / 116.0))
      end
      
    end
  end
end
