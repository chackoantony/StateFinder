class CreateStoreResources < ActiveRecord::Migration[5.0]
  def change
    create_table :store_resources do |t|
      t.string :resource_type
      t.index :resource_type
      t.integer :resource_id
      t.index :resource_id
      t.timestamps

      
    end
  end
end
