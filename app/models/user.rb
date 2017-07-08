class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:twitter, :facebook]

  validates :nickname, presence: true
  validates :college, presence: true
  validates :faculty, presence: true
  validates :grade, presence: true
  validates :gender, presence: true
  
  mount_uploader :image, PhotoUploader
  def self.from_omniauth(auth)
  	where(provider: auth["provider"], uid: auth["uid"]).first_or_create do |user|
  		user.provider = auth["provider"]
  		user.uid = auth["uid"]
  		user.username = auth["info"]["nickname"]
  	end
  end

  def self.new_with_session(params, session)
  	if session["devise.user_attributes"]
  		new(session["devise.user_attributes"], without_protection: true) do |user|
  			user.attributes = params
  			user.valid?
  		end
  	else
  		super
  	end
  end
end
