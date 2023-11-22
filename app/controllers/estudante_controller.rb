class EstudanteController < ApplicationController
  before_action :authenticate_usuario!
  before_action :autoriza_estudante, only: %i[index submeter_extensao]

  def index
    @extensoes = Extensao.includes(atividade: :modalidade).all
  end

  def submeter_extensao
    if request.post?
      @extensao = Extensao.new(extensao_params)

      if @extensao.save
        redirect_to root_path, notice: 'Extensão criada com sucesso!'
      else
        render :submeter_extensao
      end
    else
      @extensao = Extensao.new
    end
  end

  private

  def autoriza_estudante
    redirect_to root_path, alert: 'Você não tem permissão para acessar esta página.' unless current_usuario.estudante?
  end

  def extensao_params
    params.require(:extensao).permit(:nome, :descricao, :chPossivel, :chMax, :atividade_id)
  end
end
