class Question < ActiveRecord::Base
  validates :title, uniqueness: { scope: :user_id }

  validates :title,
    presence: true,
      length: { minimum: 40 }

  validates :description,
    presence: true,
      length: { minimum: 150 }

  validates :user_id,
    presence: true
end
