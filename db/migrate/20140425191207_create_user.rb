class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :register
    end
  end
end
