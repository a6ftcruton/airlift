class WelcomeController < ApplicationController

  def index
  	@top_three=Item.all.sort_by{ |item| item.average_rating }.reverse[0..2]
  end

  def about
  end

  def code
  	redirect_to "https://github.com/jessicag/the_pivot"
  end
end
