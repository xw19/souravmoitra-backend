class Article
  include Mongoid::Document
  field :title, type: String
  field :body, type: String

  validates :title, presence: true, length: { minimum: 5 }
end
