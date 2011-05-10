require 'spec_helper'

describe "Indicadores Técnicos" do  
  
  before(:all) do
    @serie = Array.new
    for i in 1..4
      @serie << Argentum::Candle.new( :abertura=>i,
                                      :fechamento=>i,
                                      :maximo=>i,
                                      :minimo=>i,
                                      :volume=>i,
                                      :data=>'2010-04-28')
    end
  end
  
  describe "# Abertura" do
    it "deve recuperar o valor de abertura de um candle" do
      valor = Argentum::Indicador::ABERTURA.call(0,@serie)
      valor.should equal(1)
    end
  end

  describe "# Fechamento" do
    it "deve retornar o valor de fechamento de um candle" do
      valor = Argentum::Indicador::FECHAMENTO.call(0,@serie)
      valor.should equal(1)
    end
  end

  describe "# Volume" do
    it "deve retornar o valor de volume de um candle" do
      valor = Argentum::Indicador::VOLUME.call(0,@serie)
      valor.should equal(1)
    end
  end
  
  describe "# Media Movel Simples" do
    it "deve ser calculada a partir de outros indicadores" do
      outro_indicador = Argentum::Indicador::ABERTURA
      media = Argentum::Indicador::MEDIA_MOVEL_SIMPLES      
      valor = media.call(3,@serie,outro_indicador)
      valor.should == 3.0
    end
  end

  describe "# Media Movel Ponderada" do
    it "deve ser calculada a partir de outros indicadores" do
      outro_indicador = Argentum::Indicador::FECHAMENTO
      media = Argentum::Indicador::MEDIA_MOVEL_PONDERADA      
      valor = media.call(3,@serie,outro_indicador)
      valor.should == (20.0/6.0) 
    end
  end
    
end