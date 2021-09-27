require 'rails_helper'

RSpec.describe 'BookService' do
  it 'can return information from the Open Library Search API' do
    location = 'denver, co'

    books = BookService.get_books(location)

    expect(books).to be_a(Hash)
    expect(books).to have_key(:numFound)
    expect(books).to have_key(:docs)
    expect(books[:docs]).to be_a(Array)
    expect(books[:docs][0]).to have_key(:isbn)
    expect(books[:docs][0][:isbn]).to be_a(Array)
    expect(books[:docs][0][:isbn][0]).to be_a(String)
    expect(books[:docs][0]).to have_key(:title)
    expect(books[:docs][0][:title]).to be_a(String)
    expect(books[:docs[0]]).to have_key(:publisher)
    expect(books[:docs][0][:publisher]).to be_a(Array)
    expect(books[:docs][0][:publisher][0]).to be_a(String)
  end
end
