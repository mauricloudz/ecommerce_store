class CreditCard < ApplicationRecord
    has_many :transbanks, as: :payment_method
end
