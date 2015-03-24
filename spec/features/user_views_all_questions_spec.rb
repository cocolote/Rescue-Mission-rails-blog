require 'rails_helper'

feature 'views questions', %Q{
  As a user
  I want to view recently posted questions
  So that I can help others
} do
  # Acceptance Criteria
  # - I must see the title of each question
  # - I must see questions listed in order, most recently posted first
  scenario 'user views a list of all questions' do
    question_1 = FactoryGirl.create(:question, title: 'Question 1 longer enough to cover 40 characters')
    question_2 = FactoryGirl.create(:question, title: 'Question 2 longer enough to cover 40 characters')

    visit '/'

    expect(page).to have_content(question_1.title)
    expect(page).to have_content(question_2.title)
  end
end
