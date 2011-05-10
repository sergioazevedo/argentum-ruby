module Argentum
  class Candle
    attr_accessor :abertura,:fechamento,:maximo,:minimo,:volume,:data
        
    def initialize(args={})
      raise ArgumentError, "O valor precisa ser maior que zero" if args[:abertura] <= 0 or args[:fechamento] <= 0 or args[:maximo] <= 0 or args[:minimo] <= 0 or args[:volume] <= 0
      raise ArgumentError, "Data nao pode ser nula" if args[:data].nil?
      
      self.abertura = args[:abertura]
      self.fechamento = args[:fechamento]
      self.maximo = args[:maximo]
      self.minimo = args[:minimo]
      self.volume = args[:volume]

      if args[:data].instance_of? DateTime
        self.data = args[:data] 
      else 
        self.data = DateTime.parse(args[:data])
      end
      self.freeze
    end

    def isBaixa
      abertura > fechamento
    end

    def isAlta
      abertura < fechamento
    end
  end
end