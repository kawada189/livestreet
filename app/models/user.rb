class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable, omniauth_providers: [:twitter]


  has_many :posts


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider 
      user.uid      = auth.uid
      user.name     = auth.info.name
      user.image_url = auth.info.image
      user.save
    end
    # find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |user|
    #   user.provider = auth["provider"]
    #   user.uid = auth["uid"]
    #   user.username = auth["info"]["nickname"]
    #   image_url = auth["info"]["image"]

    # end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
      end
    else
      super
    end
  end
end
