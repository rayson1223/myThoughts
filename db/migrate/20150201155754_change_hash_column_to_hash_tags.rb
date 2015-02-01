class ChangeHashColumnToHashTags < ActiveRecord::Migration
  def change
    rename_column :hash_tags, :hash, :hash_tag
  end
end
