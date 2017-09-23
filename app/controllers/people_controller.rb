class PeopleController < AdminController
  respond_to :html
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  after_action :save_image, only: [:create,:update]

  def index
    @people = Person.all
  end

  def show
    @person = PersonPresenter.new(@person)
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

  def save_image
    return if !params[:data_stream]
    @image = @person.image ? @person.image : Image.new(title: @person.name,
                                                       imageable_id: @book.id,
                                                       imageable_type: controller_name.singularize.camelize)
    @image.data_stream = params[:data_stream]
    @image.height = 200
    @person.save
  end

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
