module Concerns
    module Findable
        def find_by_name(name)
            all.detect{|a| a.name == name}
        end
        def find_or_create_by_name(name)
            self.find_by_name(name) || self.create(name)
        end
    end
end

# https://stackoverflow.com/questions/41985239/access-class-variables-in-a-modules-class-and-instance-methods
# https://stackoverflow.com/questions/30022273/how-to-access-class-variables-from-module