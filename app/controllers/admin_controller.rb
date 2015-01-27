class AdminController < ApplicationController
  def index
    @categories = Category.all
    @questions = Question.all
    @answers = Answer.all
  end
end
