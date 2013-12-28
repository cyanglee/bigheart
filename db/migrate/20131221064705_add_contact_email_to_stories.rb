class AddContactEmailToStories < ActiveRecord::Migration
  def change
    add_column :stories, :contact_email, :string
  end
end
