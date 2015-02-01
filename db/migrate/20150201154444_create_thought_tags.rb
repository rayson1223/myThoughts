class CreateThoughtTags < ActiveRecord::Migration
  def change
    create_table :thought_tags do |t|
      t.belongs_to :thought, index: true
      t.belongs_to :hash_tag, index: true
      t.timestamps
    end
  end
end
