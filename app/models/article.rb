class Article < ApplicationRecord
  include MeiliSearch::Rails

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  VALID_STATUSES = [ 'public', 'private', 'archived' ]

  validates :status, inclusion: { in: VALID_STATUSES  }

  meilisearch do
    attribute :title, :body
  end

  def archived?
    status == 'archived'
  end

  def self.public_count
    where( status: "public" ).count
  end
end
