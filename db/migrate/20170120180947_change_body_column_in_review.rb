class ChangeBodyColumnInReview < ActiveRecord::Migration[5.0]
  def up
    change_column_null(:reviews, :body, true)
  end
  def down
    change_column_null(:reviews, :body, false)
  end
end
