class AddCityToStory < ActiveRecord::Migration
  def change
    add_column :stories, :city, :string
  end
end
