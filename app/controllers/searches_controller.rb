class SearchesController < ApplicationController
  before_action :authenticate_user!

	def search
		@search_word = params[:search_word]
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == 'user'
			@records = User.search_for(@content, @method)
		elsif @model == 'book'
			@records = Book.search_for(@content, @method)
		else
			@records = Book.search_for(@search_word, @method)
		end
	end
end
