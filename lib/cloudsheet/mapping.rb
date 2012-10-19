module Cloudsheet
  class Mapping
    attr_reader :name, :function
    def initialize(name)
      @name = name
      @function = ->(d) {d}
    end
    
    def lambda(f)
      @function = f
      self
    end
  end
end
