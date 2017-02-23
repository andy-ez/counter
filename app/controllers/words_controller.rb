class WordsController < ApplicationController

  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 1_000
    per_page = per_page.to_i <= 0 ? 1 : per_page
    range_start = ( page.to_i * per_page.to_i ) - ( per_page.to_i - 1 )
    range_end = page.to_i * per_page.to_i > 1_000_000 ? 1_000_000 : page.to_i * per_page.to_i
    # @words = WordNumbers.new.word_array.paginate( :page => page, :per_page => per_page )
    words = WordNumbers.new(range_start, range_end).word_array
    @words = WillPaginate::Collection.create(page, per_page, 1_000_000) do |pager|
       pager.replace words
    end
  end

end