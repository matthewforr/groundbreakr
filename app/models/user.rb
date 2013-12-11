class User < ActiveRecord::Base
  validates :name, presence: true

  attr_accessible :email, :name

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.token = auth.credentials.token
      # user.nickname = auth['info']['nickname']
      user.runkeeper_normal_picture = auth.extra.raw_info.normal_picture
      user.runkeeper_medium_picture = auth.extra.raw_info.medium_picture
      user.runkeeper_profile = auth.extra.raw_info.profile
      user.runkeeper_uid = auth.uid
      user.runkeeper_gender = auth.extra.raw_info.gender
      user.runkeeper_location = auth.location
      user.run_count = 0
    end
  end

  def self.update_fund(number_of_runs)
    update_attribute(:run_count, number_of_runs)
  end

end
