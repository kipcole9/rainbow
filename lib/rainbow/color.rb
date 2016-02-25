require 'yaml'

module Rainbow
  module Color
    Chromaticity = Struct.new(:x, :y) 
    Tristimulus = Struct.new(:x, :y, :z)
    
    autoload :RGB,                'rainbow/color/spaces/rgb'
    autoload :SRGB,               'rainbow/color/spaces/rgb/srgb'
    autoload :AdobeRGB,           'rainbow/color/spaces/rgb/adobe_rgb'
    autoload :AdobeWideGamut,     'rainbow/color/spaces/rgb/adobe_wide_gamut_rgb'
    autoload :AppleRGB,           'rainbow/color/spaces/rgb/apple_rgb'
    autoload :PAL,                'rainbow/color/spaces/rgb/pal' 
    autoload :ProPhoto,           'rainbow/color/spaces/rgb/pro_photo'
    autoload :NTSC,               'rainbow/color/spaces/rgb/ntsc'
    autoload :XYZ,                'rainbow/color/spaces/xyz' 
    autoload :LAB,                'rainbow/color/spaces/lab' 
    autoload :LCH,                'rainbow/color/spaces/lch' 
    autoload :HSL,                'rainbow/color/spaces/hsl' 
    autoload :CMY,                'rainbow/color/spaces/cmy' 
    autoload :CMYK,               'rainbow/color/spaces/cmyk' 
    autoload :Utilities,          'rainbow/color/utilities'
    autoload :Collections,        'rainbow/color/collections'
    autoload :Wheel,              'rainbow/color/wheel'
    autoload :Whitepoints,        'rainbow/whitepoint'
    autoload :Whitepoint,         'rainbow/whitepoint'
    autoload :Spaces,             'rainbow/space'
    autoload :Space,              'rainbow/space'
    
  end
end