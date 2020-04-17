class CreatePermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :permissions do |t|
      t.references :role, null: false
      t.integer :authorization_id, null: false

      t.timestamps
    end
    add_index :permissions, %i[role_id authorization_id], unique: true
  end
end
