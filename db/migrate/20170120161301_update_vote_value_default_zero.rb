class UpdateVoteValueDefaultZero < ActiveRecord::Migration[5.0]
  def up
    change_column_default :votes, :value, 0
  end
  def down
    change_column_default :votes, :value, nil
  end
end
