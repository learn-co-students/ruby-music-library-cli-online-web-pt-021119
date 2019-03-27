module Concerns
  module InstanceMethods
    def initialize(name)
      self.name = name
      # self.class.all << self
    end

    def save
      self.class.all << self
    end
  end

  module ClassMethods
    def destroy_all
      self.all.clear
    end

    def create(name)
      object = self.new(name)
      self.all << object
      object
    end
  end
end
