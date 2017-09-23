class AddPolymorphismToImage < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :imageable_id, :integer
    add_column :images, :imageable_type, :string
    add_index :images, [:imageable_id, :imageable_type]
  end
end
