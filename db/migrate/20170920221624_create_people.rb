class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :email
      t.string :password
      t.date :born_at
      t.boolean :admin

      t.timestamps
    end
  end
end
