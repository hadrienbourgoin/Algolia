class CreateActors < ActiveRecord::Migration[7.0]
  def change
    create_table :actors do |t|
      t.string :fullname
      t.string :avatar

      t.timestamps
    end
  end
end
