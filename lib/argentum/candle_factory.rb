require 'argentum/candle'

module Argentum
  
  module CandleFactory
    
    def CandleFactory.constroi_candle(negocios, data)
      min = Float::MAX
      max = Float::MIN
      volume = 0
      
      negocios.each do |negocio|
        min = negocio.preco if negocio.preco < min
        max = negocio.preco if negocio.preco > max
        volume = volume + negocio.volume
      end
      abertura = negocios.first.preco
      fechamento = negocios.last.preco
      
      Argentum::Candle.new :abertura => abertura,
                           :fechamento => fechamento,
                           :maximo => max,
                           :minimo => min,
                           :volume => volume,
                           :data => data   
    end
    
    def CandleFactory.constroi_candles(negocios)
      dataAtual = negocios.first.data
      mesmo_dia = []
      candles = []
      
      negocios.each do |negocio|
        unless negocio.eh_do_dia(dataAtual)
          candles << constroi_candle(mesmo_dia, dataAtual)
          mesmo_dia.clear      
          dataAtual = negocio.data
        end          
        mesmo_dia << negocio         
      end
      candles << constroi_candle(mesmo_dia, dataAtual)      
    end
  
  end
   
end
