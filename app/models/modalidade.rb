class Modalidade < ApplicationRecord
  has_many :atividades
  # has_many :atividades, -> { order(:nome) }, class_name
end
