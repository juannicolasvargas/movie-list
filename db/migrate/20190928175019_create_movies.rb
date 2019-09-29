class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.boolean :recommended
      t.integer :age_rating
      t.date :release_data

      t.timestamps
    end
  end
end
