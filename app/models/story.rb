class Story < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader

  state_machine :state, initial: :pending do
    state :pending, value: 0
    state :editing, value: 1
    state :rejecting, value: 2
    state :publishing, value: 3

    event :pended do
      transition :editing => :pending
    end

    event :edited do
      transition [:pending, :rejecting, :publishing] => :editing
    end

    event :rejected do
      transition [:editing, :pending] => :rejecting
    end

    event :published do
      transition :pending => :publishing
    end
  end
end
