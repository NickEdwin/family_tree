require 'rails_helper'

RSpec.describe "On the landing page" do
  describe "you can create a new family" do
    it "you see a link to add a new family" do
      visit '/'

      page.has_button?('Create a new Family')

      expect(page).to_not have_content("The Edwins")

      click_on "Create a new family"

      expect(current_path).to eq("/families/new")
    end
  end
end
