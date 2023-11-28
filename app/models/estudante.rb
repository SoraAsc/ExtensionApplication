# Herda tudo de usuário
class Estudante < Usuario
  # Um Estudante tem várias extensões realizadas.
  has_many :extensao_realizadas
end
