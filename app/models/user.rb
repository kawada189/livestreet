class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :confirmable, :lockable, :timeoutable, :omniauthable, omniauth_providers: [:twitter]


#   self.from_omniauthではuidとproviderで検索してあったらそれを、無かったらレコードを作ります。
# self.new_with_sessionについては、もしこのメソッドを追加しておかなければ、Twitter認証後サインアップページで登録を行っても、
# 認証情報として取ってきたuidやproviderなどが登録されません。
# それらが登録されないのでTwitterで認証しても登録されてないユーザーとして毎回サインアップページに飛ばされます。

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.username = auth["info"]["nickname"]
    end
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
