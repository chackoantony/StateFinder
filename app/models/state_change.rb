class StateChange < ApplicationRecord
  require 'csv'

  serialize :changed_values, JSON

  belongs_to :store_resource

  validates :changed_at, :changed_values, presence: true

  def self.import(file)
    transaction do
      CSV.foreach(file, headers: true) do |row|
        resource = StoreResource.find_or_create_by(resource_type: row['object_type'], resource_id: row['object_id'])
        create!(changed_at: Time.at(row['timestamp'].to_i), changed_values: JSON.parse(row['object_changes']),
                store_resource: resource)
      end
    end
  end
end
