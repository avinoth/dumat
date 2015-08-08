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

  def self.search q
    results = where('slug LIKE ? OR slug LIKE ?', q.downcase, "#{q.downcase}_%")
    if results
      results.map { |result| {id: result.id, text: result.name} }
    end
  end
end
