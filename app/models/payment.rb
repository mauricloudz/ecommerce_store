class Payment < ApplicationRecord
  belongs_to :payable, polymorphic: true
  belongs_to :order
end
