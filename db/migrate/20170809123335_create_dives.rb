class CreateDives < ActiveRecord::Migration[5.1]
  def change
    create_table :dives do |t|
    
      t.text :date
      t.string :location
      t.integer :time_in
      t.integer :time_out
      t.integer :psi_start
      t.integer :psi_end
      t.integer :weight
      t.string :visibility
      t.string :computer
      t.string :air_temp
      t.string :surface_temp
      t.string :bottom_temp
      t.text :comments
      t.integer :dive_time
      t.integer :diver_id
      t.timestamps
    end
  end
end
