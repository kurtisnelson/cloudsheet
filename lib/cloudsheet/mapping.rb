module Cloudsheet
  class Mapping
    attr_reader :name, :function
    def initialize(name)
      @name = name
      @function = ->(d) {d}
    end
    
    def map(f)
      @function = f
      self
    end
  end
end
