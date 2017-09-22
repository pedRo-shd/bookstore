class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.date :published_at
      t.text :text
      t.decimal :value
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
