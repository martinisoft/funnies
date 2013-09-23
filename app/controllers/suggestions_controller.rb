class SuggestionsController < ApplicationController
  respond_to :html
  expose(:suggestion, attributes: :suggestion_params)

  before_filter :authenticated

  def create
    suggestion.user = current_user
    suggestion.save
    respond_with(suggestion, location: comics_path)
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:name, :website, :reason)
  end
end
