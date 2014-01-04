class ChangeStateToInt < ActiveRecord::Migration
  def change
    if Rails.env.production?
      connection.execute(%q{
      alter table stories
      alter column state
      type integer using cast(state as integer)
    })
    elsif Rails.env.development? or Rails.env.test?
      change_column :stories, :state, :integer
    end
  end
end
