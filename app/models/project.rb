class Project < ApplicationRecord
    validates :name, presence: true
    validates :version, numericality: { greater_than_or_equal_to: 0.0}
    validates :stage, numericality: { only_integer:true, in: 0..5 }
    validates :hidden, inclusion: [ true, false ]
end
