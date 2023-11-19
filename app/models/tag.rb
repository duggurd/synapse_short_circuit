class Tag < ApplicationRecord
    after_initialize :set_defaults, unless: :persisted?

    def set_defaults
        self.name ||= "tag" if self.name.nil?
        self.count = 0 if self.count.nil?
    end


end
