Dado(/^que eu esteja na pagina de cadastro$/) do
  @actions = BasicScreen.new
  @home_screen = HomeScreen.new
  @cadastro_screen = CadastroScreen.new
  @consulta_screen = ConsultaScreen.new

  @actions.click_element @home_screen.botao_cadastro
end

Quando(/^preencho o formulario com os dados validos$/) do
  @marca_modelo_carro = Faker::Vehicle.manufacture
  @ano = "2015"
  @placa = Faker::Vehicle.vin[0,7]
  @kilometragem = Faker::Number.decimal(2, 3)
  @valor = "30000"

  @basic.fill_text_field(@cadastro_screen.campo_modelo_marca, @marca_modelo_carro)
  @basic.fill_text_field(@cadastro_screen.campo_ano, @ano)
  @basic.fill_text_field(@cadastro_screen.campo_placa, @placa)
  @basic.fill_text_field(@cadastro_screen.campo_kilometragem, @kilometragem)
  @basic.fill_text_field(@cadastro_screen.campo_valor, @valor)

  @basic.click_element @cadastro_screen.botao_cadastrar
end

Entao(/^valido o cadastro realizando uma consulta$/) do
  sleep(1)
  @basic.back_click

  @basic.click_element @home_screen.botao_consulta
  @consulta_screen.find_content_list(@placa)
end
