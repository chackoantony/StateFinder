class CreateStateChanges < ActiveRecord::Migration[5.0]
  def change
    create_table :state_changes do |t|
      t.datetime :changed_at
      t.string :changed_values
      t.references :store_resource, foreign_key: true

      t.timestamps
    end
  end
end
