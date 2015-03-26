class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates :title, uniqueness: { scope: :user_id }

  validates :title,
    presence: true,
      length: { minimum: 40 }

  validates :description,
    presence: true,
      length: { minimum: 150 }

  validates :user,
    presence: true
end
