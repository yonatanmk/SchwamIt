class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.text :body, null: false
      t.integer :score, default: 0
      t.belongs_to :item, null: false
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
