class RemoveAmOrPmFromStories < ActiveRecord::Migration
  def change
    remove_column :stories, :am_or_pm
  end
end
