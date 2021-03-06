class Story < ActiveRecord::Base
  attr_accessor :report_text

  validates :appear_location, :contact_email, :info_from, :story_details, presence:true
  validates :story_name, presence:true, uniqueness: true

  belongs_to :user
  mount_uploader :image, ImageUploader

  serialize :appear_day

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

  CITIES_MARKER = Hashie::Mash.new(
      "基隆" => "基隆車站",
      "臺北&新北" => "臺北車站",
      "桃園" => "桃園車站",
      "新竹" => "新竹車站",
      "苗栗" => "苗栗車站",
      "臺中" => "臺中車站",
      "彰化" => "彰化車站",
      "南投" => "濁水車站",
      "雲林" => "雲林車站",
      "嘉義" => "嘉義車站",
      "臺南" => "臺南車站",
      "高雄" => "高雄車站",
      "屏東" => "屏東車站",
      "臺東" => "臺東車站",
      "花蓮" => "花蓮車站",
      "宜蘭" => "宜蘭車站",
      "澎湖" => "馬公市",
      "金門" => "山外車站"
  )

  #define state machine
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

  # get story location coordinate
  def self.get_coordinate(city,location)
    Geokit::Geocoders::GoogleGeocoder.geocode("#{city}#{location}").ll
  end

  # manage location coordinate for saving
  def self.manage_coordinate(city, locations)
    coordinates = {}
    locations.split(',').each do |l|
      coordinates["#{l}"] = {}
      coordinates["#{l}"] = get_coordinate(city, l)
    end
    return coordinates
  end

  def self.parse_location_json(locations)
    JSON.parse(locations)
  end
end