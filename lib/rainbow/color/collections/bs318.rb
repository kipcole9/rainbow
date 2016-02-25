module Rainbow
  module Color
    module Collections
      BS318 = {}.tap {|collection| bs318 {|code, color, names| collection[code] = {color: color, names: names}}}
    end
  end
end