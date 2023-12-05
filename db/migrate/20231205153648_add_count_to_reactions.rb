class AddCountToReactions < ActiveRecord::Migration[7.1]
  def change
    add_column :reactions, :count, :integer, default: 0
  end
end
