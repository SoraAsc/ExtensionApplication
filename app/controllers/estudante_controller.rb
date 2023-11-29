class EstudanteController < ApplicationController
  before_action :authenticate_usuario!
  before_action :autoriza_estudante, only: %i[index submeter_extensao]

  def index
    @extensao_realizadas = ExtensaoRealizada.includes(extensao: { atividade: :modalidade }).where(estudante_id: current_usuario.id).all
    @carga_horaria_total, @carga_horaria_acumulada = current_usuario.VerificarCargaHoraria()
    @eh_valido = @carga_horaria_acumulada >= 365
  end

  def submeter_extensao
    if request.post?
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

  def destroy
    @extensao_realizada = ExtensaoRealizada.find(params[:id])
    @extensao_realizada.destroy if @extensao_realizada && !@extensao_realizada.ativo
    redirect_to estudante_path
  end

  private

  def autoriza_estudante
    redirect_to root_path, alert: 'Você não tem permissão para acessar esta página.' unless current_usuario.estudante?
  end

  def extensao_realizada_params
    # params.require(:extensao_realizada).permit(:descricao, :chHoraria, :extensao_id, documentos: %i[image file])
    params.require(:extensao_realizada).permit(:descricao, :chHoraria, :extensao_id, documentos: [])
  end
end
