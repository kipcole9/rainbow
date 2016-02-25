module Rainbow
  module Color
    module Collections
      NCS = {}.tap {|collection| ncs {|code, color, names| collection[code] = {color: color, names: names}}}
    end
  end
end