class PeopleController < LoggedController
  respond_to :html
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @people = Person.all
  end

  def show
  end

  def new
    @person = Person.new
  end

  def edit
  end

  def create
    @person = Person.new(person_params)
    @person.admin = params[:admin] if session[:admin]
    flash[:notice] = "Pessoa salva" if @person.save
    respond_with @person
  end

  def update
    @person.admin = params[:admin] if session[:admin]
    flash[:notice] = "Pessoa atualizada" if @person.update(person_params)
    respond_with @person
  end

  def destroy
    flash[:notice] = 'Pessoa apagada' if @person.destroy
    respond_with @person
  end

  private

  def set_person
    @person = Person.find(params[:id]) rescue nil
    if !@person
      flash[:notice] = "Pessoa não encontrada"
      redirect_to action: "index"
      return
    end
  end

  def person_params
    params.require(:person).permit(:name, :email, :password, :password_confirmation, :born_at)
  end
end
