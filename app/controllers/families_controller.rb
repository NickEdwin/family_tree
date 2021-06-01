class FamiliesController < ApplicationController
  def index
    @families = Family.all
  end

  def new; end

  def create
    family = Family.new(family_params)
    if family.valid?
      family.save
      redirect_to "/"
      flash[:success] = "Family #{family.family_name} has been added."
    else
      redirect_to "/families/new"
      flash[:error] = family.errors.full_messages.to_sentence
    end
  end

  private

  def family_params
    params.permit(:family_name, :family_description)
  end
end
