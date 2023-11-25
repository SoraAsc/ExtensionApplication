class CoordenadorController < ApplicationController
  before_action :authenticate_usuario!
  before_action :autoriza_coordenador, only: %i[index validar_extensao]

  def index
    @extensoes_realizadas = ExtensaoRealizada.all
    @extensoes_realizadas_ativos = @extensoes_realizadas.select { |extensao_realizada| extensao_realizada.ativo == true }
    @extensoes_realizadas_nao_ativos = @extensoes_realizadas.select { |extensao_realizada| extensao_realizada.ativo == false || extensao_realizada.ativo.nil? }
  end

  def validar_extensao
    extensao_realizada = ExtensaoRealizada.find(params[:id])
    if extensao_realizada.ativo == false || extensao_realizada.ativo.nil?
      extensao_realizada.update(ativo: true)
      redirect_to root_path, notice: 'Extensão ativada com sucesso.'
    else
      redirect_to coordenador_path
    end
  end

  def criar_extensao
    if request.post?
      @extensao = Extensao.new(extensao_params)

      if @extensao.save
        redirect_to root_path, notice: 'Extensão criada com sucesso!'
      else
        render :criar_extensao
      end
    else
      @extensao = Extensao.new
    end
  end

  private

  def autoriza_coordenador
    redirect_to root_path, alert: 'Você não tem permissão para acessar esta página.' unless current_usuario.coordenador?
  end

  def extensao_params
    params.require(:extensao).permit(:nome, :descricao, :chPossivel, :chMax, :atividade_id)
  end
end
