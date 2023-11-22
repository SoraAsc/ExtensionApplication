class CoordenadorController < ApplicationController
  before_action :authenticate_usuario!
  before_action :autoriza_coordenador, only: %i[index validar_extensao]

  def index; end

  def validar_extensao; end

  private

  def autoriza_coordenador
    redirect_to root_path, alert: 'Você não tem permissão para acessar esta página.' unless current_usuario.coordenador?
  end
end
