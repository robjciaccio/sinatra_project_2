class CreateListings < ActiveRecord::Migration[4.2]
  def change
    create_table :listings do |t|
      t.string :description
      t.integer :price
      t.string :neighborhood
      t.string :borough
      t.integer :user_id
    end
  end
end
