class Api::V1::ChaptersController < ActionController::Base

  def index
    chapters = Chapter.all

    render json: chapters, status: :ok
  end
end
