class Story < ActiveRecord::Base

  validates :story_name, uniqueness: true

  STATES = Hashie::Mash.new(
      pending: 0,
      #edited: 1,
      rejected: 1,
      published: 2
  )

  TRANS_STATES = Hashie::Mash.new(
      "#{STATES.pending}" => '審核中',
      #"#{STATES.edited}" => '編輯中',
      "#{STATES.rejected}" => '駁回',
      "#{STATES.published}" => '已刊登',
  )



  belongs_to :user
  mount_uploader :image, ImageUploader

  state_machine :state, initial: :pending do
    STATES.each do |state_name, state_value|
      state state_name.to_sym, value: state_value
    end

    #event :edited do
    #  transition [:edited, :pending, :rejected, :published] => :edited
    #end

    event :pending do
      transition [:published, :rejected] => :pending
    end

    event :rejected do
      transition :pending => :rejected
    end

    event :published do
      transition :pending => :published
    end
  end
end
