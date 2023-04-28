require_relative '../screens/basic_screen.rb'

class ConsultaScreen < BasicScreen

  def elementos_da_consulta
    {
    lista_carros:'listaCarros'
    campo_placa : 'placa'
    }
  end

  def find_content_list(conteudo)
    conteudo_lista = self.elementos_da_consulta[:campo_placa].text
      until conteudo_lista == conteudo
          if conteudo_lista.include? conteudo
             click_element(conteudo)
          break
          else
             scroll_location(conteudo)
            conteudo_lista = self.elementos_da_consulta[:campo_placa].text
          end
       end
    end
end
