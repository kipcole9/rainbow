module Rainbow
  module Color
    module Collections
      FS595C = {}.tap {|collection| fs595c {|code, color, names| collection[code] = {color: color, names: names}}}
    end
  end
end