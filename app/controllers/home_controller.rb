class HomeController < ApplicationController
  def index
    @modalidades = AdquirirModalidades()
  end

  def AdquirirModalidades
    Modalidade.all
  end
end
