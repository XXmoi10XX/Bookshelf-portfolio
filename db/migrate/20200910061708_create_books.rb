class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|

      # t.references :shelf, null:false
      t.integer :number
      t.string :title
      t.string :author
      t.string :publisher
      t.integer :score


      t.timestamps
    end
  end
end
