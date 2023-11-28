class Usuario < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  SENHA_VALIDA_REGEX = /\A(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*\W)(?!.* ).{6,16}\z/.freeze

  validates :nome, :matricula, :email, :password, presence: { message: 'não pode estar em branco' }
  validates :password, confirmation: true
  validates :password, format: { with: SENHA_VALIDA_REGEX, message: 'A senha deve entre 6 a 16 caracteres e conter pelo menos uma letra maiúscula, uma letra minúsca, um caracter especial, um digito e nenhum espaço.' }

  def estudante?
    type == 'Estudante'
  end

  def coordenador?
    type == 'Coordenador'
  end
end
