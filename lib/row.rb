module Cloudsheet
  class Row
    def initialize(map = nil)
      @map = map
    end

    def parse(data)
      if @map
        out = { }
        data.each_with_index do |d, i|
          out[@map[i].name] = @map[i].function.call d
        end
        return out
      else
        return data.to_a
      end
    end
  end
end
