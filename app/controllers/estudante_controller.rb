class EstudanteController < ApplicationController
  before_action :authenticate_usuario!
  before_action :autoriza_estudante, only: %i[index submeter_extensao]

  def index
    @extensao_realizadas = ExtensaoRealizada.includes(extensao: { atividade: :modalidade }).all
    # @extensoes = Extensao.includes(atividade: :modalidade).all
  end

  def submeter_extensao
    if request.post? # && curent_usuario
      @extensao_realizada = ExtensaoRealizada.new(extensao_realizada_params.merge(estudante: current_usuario, dataDeSolicitacao: Time.current, ativo: false))
      if @extensao_realizada.save
        redirect_to root_path, notice: 'Extensão solicitada com sucesso.'
      else
        render :submeter_extensao
      end
    else
      @extensao_realizada = ExtensaoRealizada.new
    end
  end

  private

  def autoriza_estudante
    redirect_to root_path, alert: 'Você não tem permissão para acessar esta página.' unless current_usuario.estudante?
  end

  def extensao_realizada_params
    params.require(:extensao_realizada).permit(:descricao, :chHoraria, :documento, :extensao_id)
  end
end
