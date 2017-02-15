class StoreResource < ApplicationRecord
  serialize :changed_values, JSON
end
