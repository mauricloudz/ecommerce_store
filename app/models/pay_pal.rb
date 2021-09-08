class PayPal < ApplicationRecord
    has_many :payments, as: :payable
end
