class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :github_username, use: :slugged
  has_many :requests
  has_many :works
end
