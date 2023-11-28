# Herda tudo de usuário
class Coordenador < Usuario
  # Um coordenador tem várias extensões realizadas.
  has_many :extensao_realizadas
end
