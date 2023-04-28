require_relative '../screens/basic_screen.rb'

class CadastroScreen < BasicScreen


  def campo_modelo_marca
    find_element(id:'modelo')
  end

  def campo_ano
    find_element(id:'ano')
  end

  def campo_placa
    find_element(id:'placa')
  end

  def campo_kilometragem
    find_element(id:'km')
  end

  def campo_valor
    find_element(id:'valor')
  end

  def botao_cadastrar
    find_element(id:'cadastrar')
  end


end
