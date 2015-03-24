require 'rails_helper'

feature 'Delete question', %Q{
  As a user
  I want to delete a question
  So that I can delete duplicate questions
} do
  # Acceptance Criteria
  # - I must be able delete a question from the question edit page
  # - I must be able delete a question from the question details page
  # - All answers associated with the question must also be deleted  scenario
  scenario 'user deletes question from show view' do
    question = FactoryGirl.create(:question)
    visit '/'

    click_link(question.title)
    click_link('Delete')
    expect(page).to_not have_content(question.title)
  end

  scenario 'user deletes question from edit view' do
    question = FactoryGirl.create(:question)
    visit '/'

    click_link(question.title)
    click_link('Edit Question')
    click_link('Delete')
    expect(page).to_not have_content(question.title)
  end
end
