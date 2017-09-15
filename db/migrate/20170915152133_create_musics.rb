class CreateMusics < ActiveRecord::Migration[5.1]
  def change
    create_table :musics do |t|
      t.references :blog, foreign_key: true
      t.string :uuid
      t.string :title
      t.string :artwork
      t.string :url

      t.timestamps
    end
  end
end
