require 'rails_helper'

feature 'post new question', %Q{
  As a user
  I want to post a question
  So that I can receive help from others
} do
  # Acceptance Criteria
  # - I must provide a title that is at least 40 characters long
  # - I must provide a description that is at least 150 characters long
  # - I must be presented with errors if I fill out the form incorrectly
  scenario 'user views the details of a question' do
    visit '/'

    click_link('New question')

    fill_in('Title', with: 'Test question 1 has to be fill with more than 40 chars')
    description = 'a' * 151
    fill_in('Description', with: description)

    click_button('Create Question')

    expect(page).to have_content('Test question 1 has to be fill with more than 40 chars')
  end

  scenario 'user post new question with empty title' do
    question = FactoryGirl.create(:question)
    visit '/'

    click_link('New question')

    fill_in('Title', with: '')

    click_button('Create Question')

    expect(page).to have_content('Title can\'t be blank')
    expect(page).to have_content('Title is too short (minimum is 40 characters)')
  end

  scenario 'user post new question with empty description' do
    question = FactoryGirl.create(:question)
    visit '/'

    click_link('New question')

    fill_in('Description', with: '')

    click_button('Create Question')

    expect(page).to have_content('Description can\'t be blank')
    expect(page).to have_content('Description is too short (minimum is 150 characters)')
  end
end
