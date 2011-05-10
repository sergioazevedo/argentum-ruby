module Argentum
  module Indicador

    #simples
    #---------------------------------------------------------------
    FECHAMENTO = Proc.new{ |posicao,serieTemporal,block| serieTemporal[posicao].fechamento }
    ABERTURA   = Proc.new{ |posicao,serieTemporal,block| serieTemporal[posicao].abertura }
    VOLUME     = Proc.new{ |posicao,serieTemporal,block| serieTemporal[posicao].volume }
    
    #elaborados
    #---------------------------------------------------------------
    MEDIA_MOVEL_SIMPLES = Proc.new do |posicao,serieTemporal,block|
      soma = 0.0
      inicio = posicao - 2
      for i in inicio..posicao do
        soma += block.call(i,serieTemporal,nil)   
      end
      soma / 3.0      
    end             
    
    MEDIA_MOVEL_PONDERADA = Proc.new do |posicao,serieTemporal,block|
      soma = 0.0
      peso = 1
      inicio = posicao - 2
      for i in inicio..posicao do
        valor = block.call(i,serieTemporal,nil)
        soma += valor * peso
        peso = peso + 1
      end
      soma / 6.0
    end                  
         
    
  end
end