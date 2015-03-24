require 'rails_helper'

feature 'views question details', %Q{
  As a user
  I want to view a question's details
  So that I can effectively understand the question
} do
  # Acceptance Criteria
  # - I must be able to get to this page from the questions index
  # - I must see the question's title
  # - I must see the question's description
  scenario 'user views the details of a question' do
    question_1 = FactoryGirl.create(:question, title: 'Question 1 longer enough to cover 40 characters')

    visit '/'

    click_link(question_1.title)

    expect(page).to have_content(question_1.title)
    expect(page).to have_content(question_1.description)
  end
end
