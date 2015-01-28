class AdminController < ApplicationController
  http_basic_authenticate_with :name => "admin", :password => "123"

  def index
    @categories = Category.all
    @questions = Question.all
    @answers = Answer.all
  end
end
