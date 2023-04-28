Before do
  $driver.start_driver #executar o driver do appium
end

After do 
 $driver.driver_quit #encerrar a sessão do driver appium
end 