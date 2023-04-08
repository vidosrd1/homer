class CreateListes < ActiveRecord::Migration[7.0]
  def change
    create_table :listes do |t|
      t.string :title

      t.timestamps
    end
  end
end
