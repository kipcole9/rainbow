module Rainbow
  module Color
    module Collections
      RAL = {}.tap {|collection| ral {|code, color, names| collection[code] = {color: color, names: names}}}
    end
  end
end