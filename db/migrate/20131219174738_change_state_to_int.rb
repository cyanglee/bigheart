class ChangeStateToInt < ActiveRecord::Migration
  def change
    connection.execute(%q{
    alter table stories
    alter column state
    type integer using cast(state as integer)
  })
  end
end
