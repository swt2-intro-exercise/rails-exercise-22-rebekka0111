require 'rails_helper'

RSpec.describe "papers/show", type: :view do
  before(:each) do
    assign(:paper, Paper.create!(
      title: "Title",
      venue: "Venue",
      year: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Venue/)
    expect(rendered).to match(/2/)
  end
end

RSpec.describe "papers/show", type: :feature do
  it "should display the full name of the author" do
    @itBook = FactoryBot.create :paper
    visit papers_path
    @itBook.authors.each do |author|
      expect(page).to have_text(author.name)
    end
  end
end
