class Currency < ApplicationRecord
  has_many :pairs, class_name: 'Pair', foreign_key: 'currency1_id'
  has_many :pairs, class_name: 'Pair', foreign_key: 'currency2_id'
end
