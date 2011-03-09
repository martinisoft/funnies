class SuggestionsController < ApplicationController
  respond_to :html
  expose :suggestion

  def create
    if suggestion.save
      redirect_to comics_path, notice: "Thank you for suggesting a comic!"
    else
      flash[:alert] = "There was a problem submitting your suggestion"
      respond_with(suggestion)
    end
  end
end
