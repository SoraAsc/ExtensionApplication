class Modalidade < ApplicationRecord
  # Uma modalidade tem várias atividades
  has_many :atividades

  # Esta sendo utilizado
  def VerTodasAtividades
    atividades
  end

  def VerTodasExtensoes
    atividades.map(&:extensaos).flatten
  end
end
