class Evaluation < ApplicationRecord
    #belongs_to :student
    validates :evaluator_id, presence: true 

end
