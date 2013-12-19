class AddInfoFromToStories < ActiveRecord::Migration
  def change
    add_column :stories, :info_from, :string
  end
end
