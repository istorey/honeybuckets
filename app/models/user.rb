class User < ActiveRecord::Base
  has_many :reviews

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["name"]
    end
  end
end
