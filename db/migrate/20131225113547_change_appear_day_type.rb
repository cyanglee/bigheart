class ChangeAppearDayType < ActiveRecord::Migration
  def change
    change_column :stories, :appear_day, :text
  end
end
