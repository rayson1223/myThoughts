class CreateHashTags < ActiveRecord::Migration
  def change
    create_table :hash_tags do |t|
      t.string :hash,              null: false, default: ""
      t.timestamps
    end
    add_index :hash_tags, :hash,                unique: true
  end
end
