class SessionsController < ApplicationController

  def new
  end

  def create
    person = Person.auth(params[:email], params[:senha])
    if !person
      redirect_to new_session_url
      return
    end
    session[:id]    = person.id
    session[:name]  = person.name
    session[:admin] = person.admin
    flash[:notice]  = "Olá, #{person.name}!"
    redirect_to people_path
  end

  def destroy
    session[:id] = nil
    redirect_to new_session_url
  end
end
