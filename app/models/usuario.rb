class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :extensao_realizada, foreign_key: :usuario_id

  SENHA_VALIDA_REGEX = /\A(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*\W)(?!.* ).{6,16}\z/.freeze

  validates :nome, :matricula, :email, :password, presence: { message: 'não pode estar em branco' }
  validates :password, confirmation: true
  validates :password, format: { with: SENHA_VALIDA_REGEX, message: 'A senha deve entre 6 a 16 caracteres e conter pelo menos uma letra maiúscula, uma letra minúsca, um caracter especial, um digito e nenhum espaço.' }

  enum tipo: %i[estudante coordenador]

  def estudante?
    tipo == 'estudante'
  end

  def coordenador?
    tipo == 'coordenador'
  end
end
