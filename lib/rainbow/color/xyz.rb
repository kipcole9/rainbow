module Rainbow
  module Color
    class XYZ
      include Color::Utilities
      attr_reader :x, :y, :z, :space
      
      def initialize(x, y, z, options = {})
        @x, @y, @z  = x, y, z
        @space      = Rainbow::Color::Spaces['XYZ']
      end
      
      def whitepoint
        @whitepoint ||= space.whitepoint
      end
      
      def gamma
        @gamma ||= space.gamma
      end
      
      def to_srgb(options = {})
        linear_rgb = xyz_matrix * Rainbow::Color::Spaces['sRGB'].from_xyz_matrix
        Color::SRGB.new(linear_rgb[0,0], linear_rgb[0,1], linear_rgb[0,2], linearized: true).gamma_compress
      end
      
      def to_adobe_rgb(options = {})
        linear_rgb = xyz_matrix * Rainbow::Color::Spaces['AdobeRGB'].from_xyz_matrix
        Color::AdobeRGB.new(linear_rgb[0,0], linear_rgb[0,1], linear_rgb[0,2], linearized: true).gamma_compress
      end
      
      def to_lab(options = {})
        x2 = normalize_for_lab(x / tristimulus(options).x) 
        y2 = normalize_for_lab(y / tristimulus(options).y)
        z2 = normalize_for_lab(z / tristimulus(options).z)
        
        l = (116 * y2) - 16
        a = 500 * (x2 - y2)
        b = 200 * (y2 - z2)
        
        Color::Lab.new(l, a, b)
      end
      
    private
  
      def xyz_matrix
        @matrix ||= Matrix.rows([[x / 100, y / 100, z / 100]])
      end
      
      def normalize_for_lab(c)
        c > 0.008856 ? c ** ( 1 / 3.0) : ((7.787 * c) + (16 / 116.0))
      end
      
    end
  end
end
