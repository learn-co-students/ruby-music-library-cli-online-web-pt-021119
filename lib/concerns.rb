module Concerns
  module InstanceMethods
    def initialize(name)
      self.name = name
      self.class.all << self
    end
  end

  module ClassMethods
    # def all
    #   self.all
    # end
  end
end
