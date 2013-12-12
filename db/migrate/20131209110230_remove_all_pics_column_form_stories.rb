class RemoveAllPicsColumnFormStories < ActiveRecord::Migration
  def change
    remove_column :stories, :story_pics_name
    remove_column :stories, :story_pics_content_type
    remove_column :stories, :story_pics_size
    remove_column :stories, :story_pics_updated_at
  end
end
