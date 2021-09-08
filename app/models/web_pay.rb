class WebPay < ApplicationRecord
    has_many :transbanks, as: :payment_method
end
