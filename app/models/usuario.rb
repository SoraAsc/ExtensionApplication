class Usuario < ApplicationRecord
  # protected

  # attr_writer :nome, :password, :matricula

  # Configurações padrões do devise para a autenticação, recuperação e outros modulos como o registro de um novo usuário.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Fornecido pelo Active Storage, um usuário tem uma única imagem/avatar associado a si.
  has_one_attached :avatar

  # Um REGEX, responsável por restringir a senha.
  SENHA_VALIDA_REGEX = /\A(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*\W)(?!.* ).{6,16}\z/.freeze

  # Impede que esses campos sejam salvos em branco
  validates :nome, :matricula, :email, :password, presence: { message: 'não pode estar em branco' }
  # Requisita que a senha tenha um campo de validação
  validates :password, confirmation: true

  # Usa o REGEX acima para validar a senha.
  validates :password, format: { with: SENHA_VALIDA_REGEX, message: 'A senha deve entre 6 a 16 caracteres e conter pelo menos uma letra maiúscula, uma letra minúsca, um caracter especial, um digito e nenhum espaço.' }

  # Verifica o tipo da classe (é mais para auxiliar na hora de fazer verificações)
  def estudante?
    type == 'Estudante'
  end

  # Verifica o tipo da classe (é mais para auxiliar na hora de fazer verificações)
  def coordenador?
    type == 'Coordenador'
  end
end
