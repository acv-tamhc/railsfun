class Account < ApplicationRecord
  belongs_to :supplier, dependent: :destroy
end
