# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Estudante.create!(
#   nome: 'João',
#   email: 'soragg59@gmail.com',
#   matricula: '2158494',
#   password: 'M@fA6d1f',
#   password_confirmation: 'M@fA6d1f',
#   tipo: :estudante
# )

Estudante.create(
  nome: 'João',
  email: 'soragg59@gmail.com',
  matricula: '2158494',
  password: 'M@fA6d1f',
  password_confirmation: 'M@fA6d1f',
  tipo: :estudante
)

Coordenador.create(
  nome: 'Coordenador',
  email: 'tzirw@example.com',
  # senha: 'Co@rd3nador',
  matricula: '123456',
  password: 'Co@rd3nador',
  password_confirmation: 'Co@rd3nador',
  tipo: :coordenador
)

Extensao.delete_all
Atividade.delete_all
Modalidade.delete_all

aceI = Modalidade.create!(
  nome: 'ACE I - Projetos e Programas',
  chMax: 200,
  tipo: 1
)

aceII = Modalidade.create!(
  nome: 'ACE II – Cursos e Eventos',
  chMax: 200,
  tipo: 2
)

aceIII = Modalidade.create!(
  nome: 'ACE III – Prestação de Serviços',
  chMax: 200,
  tipo: 3
)

aceIV = Modalidade.create!(
  nome: 'ACE IV – Disciplinas Extensionista',
  chMax: 200,
  tipo: 4
)

# aceII = Modalidade.create(

# atividadeACEI = Atividade.create!(
#   nome: 'Participação no projeto de extensão intitulado “XXXXX”',
#   chPossivel: 100,
#   chMax: 200
# )

aceI.atividades.create!(
  nome: 'Participação no projeto de extensão intitulado “XXXXX”',
  chPossivel: 100,
  chMax: 200
)

aceI.atividades.create!(
  nome: 'Participação no projeto de extensão isolados',
  chPossivel: 50,
  chMax: 100
)

aceII.atividades.create!(
  nome: 'Participação na SCTI',
  chPossivel: 25,
  chMax: 100
)

aceII.atividades.create!(
  nome: 'Participação na organização de eventos',
  chPossivel: 20,
  chMax: 100
)

aceIII.atividades.create!(
  nome: 'Aulas supervisionadas de reforço escolar.',
  chPossivel: 10,
  chMax: 50
)

aceIV.atividades.create!(
  nome: 'Extensão',
  chPossivel: 200,
  chMax: 200
)

# aceI.atividades << atividadeACEI

# atividadeACEI.modalidade = aceI

# atividadeACEI.modalidades.create!(

# Coordenador.create(nome: 'Coordenador', email: 'tzirw@example.com', senha: 'Co@rd3nador', matricula: '123456')
