class User < ActiveRecord::Base
  has_many :stories

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  # save facebook account info
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.new(name:auth.extra.raw_info.name, provider:auth.provider, uid:auth.uid, email:auth.info.email, password:Devise.friendly_token[0,20])
      user.skip_confirmation!
      user.add_role :user
      user.save
    end
    user
  end
end
