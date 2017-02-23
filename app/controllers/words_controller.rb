class WordsController < ApplicationController
  def index
    page = (params[:page] || 1).to_i
    per_page = (params[:per_page] || 1_000).to_i
    per_page = per_page <= 0 ? 1 : per_page #force negative values to be 1
    range_start = ( page * per_page ) - ( per_page - 1 )
    range_end = page * per_page > 1_000_000 ? 1_000_000 : page * per_page
    words = WordNumbers.new( range_start, range_end ).word_array

    @words = WillPaginate::Collection.create( page, per_page, 1_000_000 ) do |pager|
       pager.replace words
    end
  end

end