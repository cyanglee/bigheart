class Story < ActiveRecord::Base

  attr_accessor :report_text

  validates :appear_location, :contact_email, :info_from, :story_details, presence:true
  validates :story_name, presence:true, uniqueness: true

  serialize :appear_day

  STATES = Hashie::Mash.new(
      :pending => 0,
      #edited: 1,
      :rejected => 1,
      :published => 2
  )

  TRANS_STATES = Hashie::Mash.new(
      "#{STATES.pending}" => '審核中',
      #"#{STATES.edited}" => '編輯中',
      "#{STATES.rejected}" => '駁回',
      "#{STATES.published}" => '已刊登',
  )

  CITIES = Hashie::Mash.new(
      "基隆市" => ".基隆市",
      "臺北市" => ".臺北市",
      "新北市" => ".新北市",
      "桃園縣" => ".桃園縣",
      "新竹縣" => ".新竹縣",
      "新竹市" => ".新竹市",
      "苗栗縣" => ".苗栗縣",
      "臺中市" => ".臺中市",
      "彰化縣" => ".彰化縣",
      "南投縣" => ".南投縣",
      "雲林縣" => ".雲林縣",
      "嘉義縣" => ".嘉義縣",
      "嘉義市" => ".嘉義市",
      "臺南市" => ".臺南市",
      "高雄市" => ".高雄市",
      "屏東縣" => ".屏東縣",
      "臺東縣" => ".臺東縣",
      "花蓮縣" => ".花蓮縣",
      "屏東縣" => ".屏東縣",
      "宜蘭縣" => ".宜蘭縣",
      "澎湖縣" => ".澎湖縣",
      "金門縣" => ".金門縣"
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
      transition [:pending, :published] => :rejected
    end

    event :published do
      transition [:pending, :published, :rejected] => :published
    end
  end
end
