class Request < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_many :works
  has_many :upvotes

  belongs_to :from_language, class_name: "Language", foreign_key: "from_language_id"
  belongs_to :to_language, class_name: "Language", foreign_key: "to_language_id"

  scope :interested_by, lambda {|id| joins(:upvotes).where('upvotes.user_id = ?', id) }

  def self.by_language(language_id, direction)
    direction = "#{direction}_language"
    where("#{direction} = ?", language_id)
  end

  def upvoted_by? user
    upvotes.find_by(user_id: user).present?
  end
end
