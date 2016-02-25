module Rainbow
  module Color
    module Collections
      AS2700 = {}.tap {|collection| as2700 {|code, color, names| collection[code] = {color: color, names: names}}}
    end
  end
end