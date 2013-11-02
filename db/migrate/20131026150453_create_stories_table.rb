class CreateStoriesTable < ActiveRecord::Migration
  def change
    create_table :stories do |t|
    t.string :appear_day
    t.string :appear_time
    t.string :appear_location
    t.string :story

    t.timestamps
    end
  end
end
