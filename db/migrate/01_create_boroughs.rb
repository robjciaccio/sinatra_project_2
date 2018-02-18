class CreateBoroughs < ActiveRecord::Migration[4.2]
  def change
    create_table :boroughs do |t|
      t.string :name
    end
  end
end
