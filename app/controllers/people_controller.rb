class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  respond_to :html

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)
    flash[:notice] = 'Pessoa salva' if @person.save
    respond_with @person
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    flash[:notice] = 'Pessoa atualizada' if @person.update(person_params)
    respond_with @person
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    flash[:notice] = 'Pessoa apagada' if @person.destroy
    respond_with @person
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:name, :email, :password, :born_at, :admin)
    end
end
