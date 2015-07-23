class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :github_username, use: :slugged
  has_many :requests
  has_many :works
  has_many :upvotes
end
