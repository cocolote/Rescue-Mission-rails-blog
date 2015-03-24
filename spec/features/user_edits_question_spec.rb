require 'rails_helper'

feature 'edit question', %Q{
  As a user
  I want to edit a question
  So that I can correct any mistakes or add updates
} do
  # Acceptance Criteria
  # - I must provide valid information
  # - I must be presented with errors if I fill out the form incorrectly
  # - I must be able to get to the edit page from the question details page
  scenario 'user edits question from show view' do
    question = FactoryGirl.create(:question)
    visit '/'

    click_link(question.title)
    click_link('Edit Question')

    fill_in('Title', with: 'Edited edited question that has to be 40 characters or longer')

    click_button('Update Question')

    expect(page).to have_content('Edited edited question that has to be 40 characters or longer')
  end

  scenario 'user edits question from show view with empty title' do
    question = FactoryGirl.create(:question)
    visit '/'

    click_link(question.title)
    click_link('Edit Question')

    fill_in('Title', with: '')

    click_button('Update Question')

    expect(page).to have_content('Title can\'t be blank')
    expect(page).to have_content('Title is too short (minimum is 40 characters)')
  end

  scenario 'user edits question from show view with empty description' do
    question = FactoryGirl.create(:question)
    visit '/'

    click_link(question.title)
    click_link('Edit Question')

    fill_in('Description', with: '')

    click_button('Update Question')

    expect(page).to have_content('Description can\'t be blank')
    expect(page).to have_content('Description is too short (minimum is 150 characters)')
  end
end
