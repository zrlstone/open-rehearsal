class Role < ApplicationRecord
  belongs_to :rehearsal
  belongs_to :instrument
end
