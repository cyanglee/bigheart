class ChangeStoryDetailsLength < ActiveRecord::Migration
  def change
    change_column :stories, :story_details, :string, :limit => 10000
  end
end
