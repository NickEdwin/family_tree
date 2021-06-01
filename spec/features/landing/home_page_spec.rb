require 'rails_helper'

RSpec.describe "On the landing page" do
  describe "when there are no families in the system" do
    it "you see a message telling you so" do
      visit '/'

      expect(page).to have_content("There are currently no families in the system.")
    end
  end
end
