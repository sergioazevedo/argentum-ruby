module Argentum
  
  class Negocio                    
    attr_accessor :preco, :quantidade, :data

    def initialize(args={})     
      raise ArgumentError, "O valor precisa ser maior que 0" if args[:preco] <= 0 or args[:quantidade] <= 0
      raise ArgumentError, "Data nao pode ser nula" if args[:data].nil?
      
      self.preco = args[:preco]
      self.quantidade = args[:quantidade]  

      if args[:data].instance_of? DateTime
        self.data = args[:data] 
      else 
        self.data = DateTime.parse(args[:data])
      end

      self.freeze
    end
  
    def volume
      preco * quantidade 
    end     
    
    def eh_do_dia(outraData) 
      ( data.day == outraData.day and data.month == outraData.month and data.year == outraData.year )
    end

  end
  
end