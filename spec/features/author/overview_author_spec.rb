require 'rails_helper'

describe "Author index page", type: :feature do
  it "should render without error" do
      visit authors_path
  end

  it "should have a link to create a new author" do
      visit authors_path
      expect(page).to have_link 'New', href: new_author_path
  end

  it "should contain a table with a row for ech author" do
      visit authors_path
      expect(page).to have_css('table tr', count: Author.count + 1)
  end

  it "should have a table with the headings name and homepage" do
      visit authors_path
      expect(page).to have_css('table th', text:'Name')
      expect(page).to have_css('table th', text:'Homepage')
  end
end
