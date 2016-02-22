require 'yaml'

module Rainbow
  module Color
    Chromaticity = Struct.new(:x, :y) 
    Tristimulus = Struct.new(:x, :y, :z)
    
    autoload :RGB,                'rainbow/color/rgb'
    autoload :SRGB,               'rainbow/color/rgb/srgb'
    autoload :AdobeRGB,           'rainbow/color/rgb/adobe_rgb'
    autoload :AdobeWideGamut,     'rainbow/color/rgb/adobe_wide_gamut_rgb'
    autoload :AppleRGB,           'rainbow/color/rgb/apple_rgb'
    autoload :PAL,                'rainbow/color/rgb/pal' 
    autoload :ProPhoto,           'rainbow/color/rgb/pro_photo'
    autoload :NTSC,               'rainbow/color/rgb/ntsc'
    autoload :XYZ,                'rainbow/color/xyz' 
    autoload :Lab,                'rainbow/color/lab' 
    autoload :Lch,                'rainbow/color/lch' 
    autoload :Utilities,          'rainbow/color/utilities'
    autoload :Whitepoints,        'rainbow/whitepoint'
    autoload :Whitepoint,         'rainbow/whitepoint'
    autoload :Spaces,             'rainbow/space'
    autoload :Space,              'rainbow/space'
    
  end
end