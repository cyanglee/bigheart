class AddStoryPicToStory < ActiveRecord::Migration
  def change
    add_column :stories, :story_pics_name, :string
    add_column :stories, :story_pics_content_type, :string
    add_column :stories, :story_pics_size, :integer
    add_column :stories, :story_pics_updated_at, :datetime
  end
end
