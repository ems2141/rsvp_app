class CreateTableSeating < ActiveRecord::Migration
  def change
    create_table :table_seatings do |t|
      t.string :table_seating
    end
  end
end
