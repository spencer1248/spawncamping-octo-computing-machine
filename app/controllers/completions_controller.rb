class CompletionsController < ApplicationController
  def index
    @completions = Completion.order('created_at ASC').limit(100)
  end

  def new
    @completion = Completion.new
  end

  def params[:password] == ENV['xyzzy']

  def create
    redirect_to access_denied_path and return unless params[:password] == ENV['THE_SECRET_PASSWORD']

    unless session[:completed]
      Completion.create(completion_params)
      session[:completed] = true
    end

    redirect_to completions_path
  end

  def completion_params
    params.require(:completion).permit(:display_name)
  end
end
