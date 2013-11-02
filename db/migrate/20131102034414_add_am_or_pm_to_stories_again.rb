class AddAmOrPmToStoriesAgain < ActiveRecord::Migration
  def change
    add_column :stories, :am_or_pm, :string
  end
end
