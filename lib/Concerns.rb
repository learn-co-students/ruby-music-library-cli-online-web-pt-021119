require_relative '../config/environment.rb'

module Concerns
    module Findable
        def find_by_name(name)
            self.all.detect{|song|song.name==name}
        end
    
        def find_or_create_by_name(name)
            !find_by_name(name) ? create(name) : find_by_name(name)
        end
    end

end