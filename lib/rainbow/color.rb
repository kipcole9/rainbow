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
    autoload :LAB,                'rainbow/color/lab' 
    autoload :LCH,                'rainbow/color/lch' 
    autoload :HSL,                'rainbow/color/hsl' 
    autoload :CMY,                'rainbow/color/cmy' 
    autoload :CMYK,               'rainbow/color/cmyk' 
    autoload :Utilities,          'rainbow/color/utilities'
    autoload :Wheel,              'rainbow/color/wheel'
    autoload :Whitepoints,        'rainbow/whitepoint'
    autoload :Whitepoint,         'rainbow/whitepoint'
    autoload :Spaces,             'rainbow/space'
    autoload :Space,              'rainbow/space'
    
  end
end