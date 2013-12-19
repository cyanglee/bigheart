class ChangeStateDataType < ActiveRecord::Migration
  def change
    change_column :stories, :state, :integer
  end
end
