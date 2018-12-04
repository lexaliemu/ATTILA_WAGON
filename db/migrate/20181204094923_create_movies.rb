class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.integer :release_date
      t.text :syllabus
      t.string :duration
      t.string :actors
      t.string :movie_url
      t.integer :rating
      t.integer :price
      t.string :trailer_url
      t.integer :number_rates
      t.timestamps
    end
  end
end
