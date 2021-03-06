class PersonsController < ApplicationController

  def index
    @persons = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
    render partial: "form"
  end

  def edit
    @person = Person.find(params[:id])
    render partial: "form"
  end

  def update
    @person = Person.find(params[:id])
    if @person.update(person_params)
      redirect_to persons_path
    else
      render :new
    end
  end

  def destroy
    @person = Person.find(params[:id]).destroy
    redirect_to persons_path
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name, :age, :hair_color, :eye_color, :gender, :alive)
  end




end
