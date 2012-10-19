module Cloudsheet
  class Row
    def initialize(map = nil)
      @map = map
    end

    def parse(data)
      if @map
        out = { }
        data.each_with_index do |d, i|
          out[@map[i].name] = @map.parse(i, d)
        end
        out
      else
        return data.to_a
      end
    end
  end
end
