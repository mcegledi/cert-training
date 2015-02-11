class GameController < ApplicationController
  add_flash_types :warning, :result

  def index
    session[:count] = 0
    session[:question_ids] = []
    session[:failures] = 0
  end

  def saveSettings
    index()

    if params[:quantity].to_i > Question.all.size
      redirect_to start_path, warning: 'The quantity exceded the amount of questions'
    else
      session[:quantity] = params[:quantity]
      session[:question_ids] = []

      $is_next = true
      session[:count] += 1

      redirect_to action: "get_question"
    end
  end

  def get_question
    if session[:quantity].to_i < session[:count].to_i
      redirect_to action: "end"
    end

    if Question.all.size >= session[:count]
      if $is_next
        begin
          @current_question = Question.offset(rand(Question.count)).first
        end while(session[:question_ids].include?(@current_question.id))

        session[:question_ids] << @current_question.id
        $is_next = false
      else
        @current_question = Question.find(session[:question_ids].last.to_i)
      end
    else
      redirect_to action: "end"
    end
  end

  def next
    if answer_is_right(params[:question_id].to_i, params[:checked_answers_ids])
      $is_next = true
      session[:count] += 1
      redirect_to action: "get_question"
    else
      session[:failures] += 1
      redirect_to({ action: 'get_question' }, warning: 'Sorry that was wrong!')
    end
  end

  def answer_is_right(question_id, answer_ids)
    if question_id != nil and answer_ids != nil
      right_answers = Question.find(question_id).answers.where(is_right: true).pluck(:id)

      if  answer_ids.map{ |i| i.to_i } == right_answers
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def end
    @failure_points = session[:failures]
  end
end
