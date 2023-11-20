class Usuario < ApplicationRecord
  # SENHA_VALIDA_REGEX = /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*\W)(?!.* ).{6,16}$/

  SENHA_VALIDA_REGEX = /\A(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*\W)(?!.* ).{6,16}\z/.freeze

  validates :nome, :matricula, :email, :senha, presence: { message: 'não pode estar em branco' }
  validates :senha, confirmation: true
  # validates :senha, length: { minimum: 6 }
  validates :senha, format: { with: SENHA_VALIDA_REGEX, message: 'A senha deve entre 6 a 16 caracteres e conter pelo menos uma letra maiúscula, uma letra minúsca, um caracter especial, um digito e nenhum espaço.' }
end
