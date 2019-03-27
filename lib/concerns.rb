module Concerns
  module InstanceMethods
    def save
      self.class.all << self
    end
  end

  module ClassMethods
    def destroy_all
      self.all.clear
    end

    def create(name)
      obj = self.new(name)
      obj.save
      obj
    end

    def find_by_name(name)
      self.all.detect{|obj| obj.name == name}
    end

    def find_or_create_by_name(name)
      if (obj = self.find_by_name(name)).nil?
        self.create(name)
      else
        obj
      end
    end
  end
end
