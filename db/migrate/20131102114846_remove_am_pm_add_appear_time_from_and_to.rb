class RemoveAmPmAddAppearTimeFromAndTo < ActiveRecord::Migration
  def change
    remove_column :stories, :am_or_pm
    rename_column :stories, :appear_time, :appear_time_from
    add_column :stories, :appear_time_to, :string
  end
end
