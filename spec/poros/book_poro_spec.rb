require 'rails_helper'

RSpec.describe 'Book Poro' do
  it 'exists with attributes' do
    book = {
            isbn: [
                    "9780762507849",
                    "0762507845"
                  ],
            title: "Denver, Co",
            publisher: [
                    "Universal Map Enterprises"
                      ]
            }

    x = Book.new(book)

    expect(x).to be_a(Book)
  end

end
