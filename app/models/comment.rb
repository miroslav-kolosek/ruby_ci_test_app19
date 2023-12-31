class Comment < ApplicationRecord
  belongs_to :article

  VALID_STATUSES = [ 'public', 'private', 'archived' ]

  validates :status, inclusion: { in: VALID_STATUSES  }

  def archived?
    status == 'archived'
  end

  def public_count
    where( status: 'public' ).count
  end
end
