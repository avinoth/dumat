class Language < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :requests


  def request_from
    Request.by_language(self.id, 'from')
  end

  def request_to
    Request.by_language(self.id, 'to')
  end
end
