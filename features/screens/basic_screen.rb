class BasicScreen

  def find_element(element)
    
    wait = Selenium::WebDriver::Wait.new :timeout => 20
    wait.until { driver.find_element(element).displayed? }
    return element
  rescue => e
    raise "Não foi possível encontrar o campo: #{element}!\nErro: #{e.message}"
  end

  def fill_text_field(element, text, time_out=5)
    find_element(element).click
    find_element(element).send_keys(text)
    hide_keyboard_action
  rescue => e
    raise "Erro ao preencher campo #{element}.\nErro: #{e.message}"
  end

  def click_element(element, time_out=5)
    find_element(element).click
    hide_keyboard_action
  rescue => e
    raise "Erro ao clicar no elemento: #{element}.\nErro: #{e.message}"
  end

  def hide_keyboard_action
     if is_keyboard_shown == true
       hide_keyboard
     end
  end

  def back_click
    back
  end

  def scroll_location(element)
    scrollTo(element)
  end

end
