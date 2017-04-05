class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
