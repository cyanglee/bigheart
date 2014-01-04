class ChangeStoryLocationType < ActiveRecord::Migration
  def change
    change_column :stories, :appear_location, :text
  end
end
