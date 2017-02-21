class StoreResource < ApplicationRecord

  has_many :state_changes, dependent: :destroy

  validates :resource_type, :resource_id, presence: true
  validates :resource_type, uniqueness: { scope: :resource_id }

  # Method returns the state of an object at given time point
  def state_at(time_string)
    return {} if time_string.blank?
    changes = state_changes.where('changed_at <= ?', DateTime.parse(time_string)).pluck(:changed_values)
    changes.inject({}) { |c, state| c.merge(state) }
  end
end
