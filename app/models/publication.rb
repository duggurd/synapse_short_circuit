class Publication < ApplicationRecord
    after_initialize :set_defaults, unless: :persisted?

    def set_defaults
        self.name ||= "publication_name" if self.name.nil?
        self.description ||= "shorthand description of publication" if self.description.nil?
        self.body ||= "main content of publication" if self.body.nil?
        self.resources ||= "sources and resources used" if self.resources.nil?
        self.stage = 0 if self.stage.nil?
        self.hidden = true if self.hidden.nil?
    end

    validates :name, presence: true
    validates :stage, numericality: { only_integer:true, in: 0..4 }
    validates :hidden, inclusion: [ true, false ]
end
