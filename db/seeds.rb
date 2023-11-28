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
  password_confirmation: 'M@fA6d1f'
)

Coordenador.create(
  nome: 'Fermin Alfredo Tang Montane',
  email: 'tzirw@example.com',
  matricula: '123456',
  password: 'Co@rd3nador',
  password_confirmation: 'Co@rd3nador'
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
  nome: 'Participação em atividades de extensão ligadas a projetos e programas de extensão integrados à matriz curricular.',
  chPossivel: 100,
  chMax: 200,
  categoria: 3
)

aceI.atividades.create!(
  nome: 'Participação em atividades de extensão ligadas a projetos isolados ou sob demanda cadastrados na PROEX.',
  chPossivel: 50,
  chMax: 100,
  categoria: 2
)

aceII.atividades.create!(
  nome: 'Participação na organização de cada curso de formação ou atualização de público-alvo específico.',
  chPossivel: 25,
  chMax: 100,
  categoria: 0
)

aceII.atividades.create!(
  nome: 'Participação na organização de eventos',
  chPossivel: 20,
  chMax: 100,
  categoria: 1
)

aceII.atividades.create!(
  nome: 'Eventos diversos para a popularização da ciência em espaços não formais de ensino',
  chPossivel: 20,
  chMax: 100,
  categoria: 1
)

aceII.atividades.create!(
  nome: 'Participação em Comissão organizadora de Campanhas ouprogramas sociais',
  chPossivel: 10,
  chMax: 50,
  categoria: 1
)

aceIII.atividades.create!(
  nome: 'Capacitação Supervisionada em eventos para professores da rede pública de educação básica (educação continuada).',
  chPossivel: 20,
  chMax: 100,
  categoria: 4
)
aceIII.atividades.create!(
  nome: 'Aulas supervisionadas de reforço escolar.',
  chPossivel: 10,
  chMax: 50,
  categoria: 4
)
aceIII.atividades.create!(
  nome: 'Assessoria, consultoria, curadoria em atividades ou serviços para públicos-alvo específicos.',
  chPossivel: 10,
  chMax: 100,
  categoria: 5
)
aceIII.atividades.create!(
  nome: 'Atendimento ao público em espaços de cultura, ciência e tecnologia (museus, cineclubes, galerias e afins)',
  chPossivel: 10,
  chMax: 50,
  categoria: 5
)
aceIII.atividades.create!(
  nome: 'Participação em organização e/ou redação de jornal ou informativo sociocultural, científico-tecnológico do curso ou da UENF, podcast, vídeos, etc.',
  chPossivel: 10,
  chMax: 50,
  categoria: 6
)

aceIV.atividades.create!(
  nome: 'Atividade Customizada',
  chPossivel: 200,
  chMax: 200,
  categoria: 7
)

# aceI.atividades << atividadeACEI

# atividadeACEI.modalidade = aceI

# atividadeACEI.modalidades.create!(

# Coordenador.create(nome: 'Coordenador', email: 'tzirw@example.com', senha: 'Co@rd3nador', matricula: '123456')
