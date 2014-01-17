class ChangeLocationTypeBackToString < ActiveRecord::Migration
  def change
    change_column :stories, :appear_location, :string
  end
end
