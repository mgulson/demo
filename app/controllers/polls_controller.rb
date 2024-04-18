class PollsController < ApplicationController
  def index
    render json: Poll.all
  end

  def show
    poll = Poll.find(params[:id]).includes(:poll_items)
    poll_items = poll.poll_items
    if poll
      render json: {poll: poll, poll_items: poll_items}
    else
      render json: {message: "The poll was not found"}, status: :bad_request
    end
  end

  def create
    params.require(:name)
    params.require(:question)
    ## allow username?
    params.require(:user_id)
    poll = Poll.create(name: params[:name], question: params[:question], user_id: params[:user_id])
    
    if poll 
      if params[:poll_items]

        poll_items = create_poll_items(poll.id)
        render json: { poll: poll, poll_items: poll_items }
      else
        render json: poll
      end
    else
      render json: { message: "The poll was not created" }
    end
  end 

  def create_poll_items(poll_id)
    poll_items = []
    poll_items_params = params[:poll_items]
    if poll_items_params.present?
      poll_items_params.each do |value|
        poll_items.push(PollItem.create(poll_id: poll_id, value: value))
      end
    end
    poll_items
  end

end