# Appium - Android

- Montando a estrutura de um projeto no framework: Cucumber - Ruby - Appium - Android
- Definindo os capabilities appPackage e appActivity
- Utilizando comandos do SeleniumWebDriver
- Executando os testes com Appium
  

### Montando a estrutura de um projeto no framework: Cucumber - Ruby - Appium - Android

Note: A estrutura de pastas do projeto pode ser criada utilizando a gem testgen

Steps para configuração:

* [features] - Folder features 
step 1: Criar pasta 'config' com os arquivos: devices.yaml e emulators.yaml

* [config] - Folder config
step 1: Nos arquivos: devices.yaml e emulators.yaml definir os capabilites para o dispositivo móvel e para os emuladores:

* [devices.yaml] 

```
devices:
 samsung:
   caps:
   deviceName: "Samsung"
   platformName: "Android"
   version: "6.0.1"    #setar a versão do android utilizado no device
   app: #inserir o diretório do do app "\meuApp.apk"
   appPackage: "br.com.exemplo" 
   appActivity: "br.com.exemplo.MainActivity"
   newCommandTimeout: "3600"
   port: 4723     
   appium_port: 4723
   appium_lib: { wait: 20, debug: false}
   
```

* [env.rb] 

``` 
# adicionar os requires: 
require 'appium_lib' 
require 'selenium-webdriver'

#Setar o caminho do arquivo devices.yaml 
$device = 'samsung' #Setar Device
$base_devices = YAML.load_file('./config/devices.yaml')['devices'][$device]

#Setar o caminho do arquivo emulators.yaml 
$emulators = 'Nexus5' #Setar Emulador
$base_emulators = YAML.load_file('./config/emulators.yaml')['emulators'][$emulators]

#Executar o Driver Appium:
Appium::Driver.new($base_devices)
Appium.promote_appium_methods Object

```

* [Gemfile] 

```  
gem 'appium_lib'
gem 'selenium-webdriver'

```
* [hooks.rb] 

``` 
Before do
  $driver.start_driver #executar o driver do appium
end

After do 
 $driver.driver_quit #encerrar a sessão do driver appium
end	

```

# Como definir os capabilities appPackage e appActivity para Android 

- Desbloqueie seu dispositivo móvel ou emulador. 
- Abra o prompt de comando e execute o comando adb devices
- Após executar o comando adb devices a lista de dispositivos/emuladores conectados é exibida.
- Execute o comando adb shell
- Abra o aplicativo na Activity que deseja localizar o appPackage e o appActivity.
- Agora, execute o comando:  dumpsys window windows | grep -E ‘mCurrentFocus’


Note:
- AppPackage começa com com. e termina antes do backshash (/).
- AppActivity começa após a barra invertida (/) e vai até o final.

### Utilizando comandos do SeleniumWebDriver:

``` 
#buscar elemento
wait = Selenium::WebDriver::Wait.new :timeout => 20
wait.until { driver.find_element(element).displayed? }

#clicar no elemento
driver.find_element(element).click

#esconder teclado
hide_keyboard

#verificar se o teclado esta presente na tela 
is_keyboard_shown == true

#preencher campos
driver.find_element(element).send_keys(text)

#botãoo voltar 
back

```
### Executando os testes com Appium:

Steps para a execução do teste:

- Step 1: Iniciar Emulador Android ou Dispositivo Móvel e verificar se não esta bloqueado
- Step 2: Executar o Appium.exe
- Step 3: Clicar no botão Start Server para iniciar a sessão do appium
- Step 4: Executar o comando cucumber no terminal
- Step 5: Execução realizada# Poc_Exemplo_Appium
