class ChangeStateToInt < ActiveRecord::Migration
  def change
    connection.execute(%q{
    alter table tweets
    alter column number
    type integer using cast(number as integer)
  })
  end
end
