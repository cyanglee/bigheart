class AddStoryNameToStories < ActiveRecord::Migration
  def change
    add_column :stories, :story_name, :string
  end
end
