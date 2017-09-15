class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :name
      t.text :description
      t.string :avatar

      t.timestamps
    end
  end
end
