module ApplicationHelper

  def auth_link
      if session[:id].present?
        link_to 'Logout', sair_path(session[:id]), method: 'delete'
      else
        link_to 'Login', autenticar_path
      end
    end

  end
