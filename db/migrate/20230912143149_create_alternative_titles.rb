class CreateAlternativeTitles < ActiveRecord::Migration[7.0]
  def change
    create_table :alternative_titles do |t|
      t.string :alt_title
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
