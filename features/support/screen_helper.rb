Dir[File.join(File.dirname(__FILE__),'../screens/*_screen.rb')].each { |file| require file }

module Screens

    def basic
        @basic ||= BasicScreen.new
    end

    def home
        @home ||= HomeScreen.new
    end

    def consulta
        @consulta ||= ConsultaScreen.new
    end

    def cadastro
        @cadastro ||= CadastroScreen.new
    end

end