module Rainbow
  module Color
    module Collections
      BS4800 = {}.tap {|collection| bs4800 {|code, color, names| collection[code] = {color: color, names: names}}}
    end
  end
end