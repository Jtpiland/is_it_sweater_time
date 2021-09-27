class Api::V1::BookSearchController < ApplicationController

  def index
    book_search = BookSearchFacade.fetch_books(params[:location])

    render json: book_search
  end
end
