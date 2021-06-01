require 'rails_helper'

RSpec.describe "Creating a new family" do
  describe "you can create a new family" do
    it "you fill in a form successfully" do
      visit '/families/new'

      fill_in "family_name", with: "Edwin"
      fill_in "family_description", with: "They're a noble family with routes in Staten Italy"

      click_on("Create Family")

      expect(current_path).to eq("/")

      expect(page).to have_content("Family Edwin has been added.")
    end
  end

  describe "you cannot create a new family" do
    it "you fill in a form invalid" do
      visit '/families/new'

      fill_in "family_name", with: ""
      fill_in "family_description", with: ""

      click_on("Create Family")

      expect(current_path).to eq("/families/new")

      expect(page).to have_content("Family name can't be blank and Family description can't be blank")
    end
  end

  describe "new families are seen on the main page" do
    it "displays family cards " do
      visit '/'

      expect(page).to have_content("There are currently no families in the system.")

      @family = Family.create(family_name: "Edwin", family_description: "A real fams fam")

      visit '/'

      expect(page).to_not have_content("There are currently no families in the system.")

      within(".family-#{@family.id}") do
        expect(page).to have_content(@family.family_name)
      end
    end
  end
end
