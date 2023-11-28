class Modalidade < ApplicationRecord
  # Uma modalidade tem várias atividades
  has_many :atividades
end
