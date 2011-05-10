require 'spec_helper'

describe "Uma Fábrica de Candle" do
  
  it "deve criar um candle a partir de uma lista de negocios" do
    lista = []
    data = '2010-04-24'
    lista << Argentum::Negocio.new(:preco =>10, :quantidade=>20, :data => data) 
    lista << Argentum::Negocio.new(:preco =>30, :quantidade=>15, :data => data)
    lista << Argentum::Negocio.new(:preco =>20, :quantidade=>18, :data => data)
    
    candle = Argentum::CandleFactory.constroi_candle(lista,data)
    
    candle.abertura.should == 10
    candle.fechamento.should == 20
    candle.minimo.should == 10
    candle.maximo.should == 30
    candle.volume.should == 1010
    candle.data.should == DateTime.parse(data)
  end
  
  it "deve criar uma lista de candles para uma lista de negocios de varios dias" do
    lista = []          
    hoje = '2010-04-24'
    amanha = '2010-04-25'
    depois = '2010-04-26'
    
    lista << Argentum::Negocio.new(:preco=>10, :quantidade=>20, :data => hoje)
    lista << Argentum::Negocio.new(:preco=>30, :quantidade=>15, :data => hoje)
    lista << Argentum::Negocio.new(:preco=>20, :quantidade=>18, :data => hoje)
                                  
    lista << Argentum::Negocio.new(:preco=>40, :quantidade=>10, :data => amanha)
    lista << Argentum::Negocio.new(:preco=>50, :quantidade=>40, :data => amanha)       
                                  
    lista << Argentum::Negocio.new(:preco=>27, :quantidade=>15, :data => depois)
    lista << Argentum::Negocio.new(:preco=>38, :quantidade=>27, :data => depois)       
    
    candles = Argentum::CandleFactory.constroi_candles(lista)
    
    candles.size.should equal(3)    
  end
  
  
end