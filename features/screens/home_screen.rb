require_relative '../screens/basic_screen.rb'

class HomeScreen < BasicScreen


  def label_titulo
    find_element(id: 'textView6')
  end

  def botao_cadastro
    find_element(id: 'cadastrar')
  end

  def botao_consulta
    find_element(id: 'consulta')
  end
end
