class Transbank < ApplicationRecord
  belongs_to :payment_method, polymorphic: true
  has_many :payments, as: :payable
end
