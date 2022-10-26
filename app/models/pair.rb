class Pair < ApplicationRecord
  belongs_to :currency1, class_name: 'Currency'
  belongs_to :currency2, class_name: 'Currency'
end
