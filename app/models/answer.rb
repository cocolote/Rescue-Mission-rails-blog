class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates :question,
    presence: true

  validates :user,
    presence: true

  validates :body,
    presence: true
end
