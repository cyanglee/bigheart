class ChangeStoryColumnToStoryDetails < ActiveRecord::Migration
  def change
    rename_column :stories, :story, :story_details
  end
end
