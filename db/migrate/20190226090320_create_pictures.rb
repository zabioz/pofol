class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.references :candidate, foreign_key: true
      t.string :picture

      t.timestamps
    end
  end
end

