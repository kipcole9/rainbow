module Rainbow
  module Color
    module Collections
      PANTONE = {}.tap {|collection| pantone {|code, color, names| collection[code] = {color: color, names: names}}}
    end
  end
end