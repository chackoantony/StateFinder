class CreateStoreResources < ActiveRecord::Migration[5.0]
  def change
    create_table :store_resources do |t|
      t.string :resource_type
      t.datetime :changed_at
      t.string :changed_values

      t.timestamps
    end
  end
end
