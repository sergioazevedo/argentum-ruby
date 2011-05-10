require 'spec_helper'

describe "Um Negocio" do
  
  it "nao deve permitir preco negativo" do
    lambda do 
      Argentum::Negocio.new :preco => -10, 
                            :quantidade => 20, 
                            :data => '2010-04-28'
    end.should raise_error(ArgumentError)
  end    

  it "nao deve permitir quantidade negativa" do
    lambda do 
      Argentum::Negocio.new :preco => 10, 
                            :quantidade => -20, 
                            :data => '2010-04-28'
    end.should raise_error(ArgumentError)
  end    
      
  it "deve ter uma data" do
    lambda do 
      Argentum::Negocio.new :preco => -10, 
                            :quantidade => 20
    end.should raise_error(ArgumentError)
  end    
  
  it "deve ser imutavel" do
    negocio = Argentum::Negocio.new :preco => 10, 
                                    :quantidade => 20, 
                                    :data => '2010-04-28'    
    lambda{ negocio.preco = 40 }.should raise_error(TypeError)
    lambda{ negocio.quantidade = 40 }.should raise_error(TypeError)
    lambda{ negocio.data = DateTime.parse('2010-05-01') }.should raise_error(TypeError)
  end
  
  it "deve calcular o volume" do
    negocio = Argentum::Negocio.new :preco => 10, 
                                    :quantidade => 20, 
                                    :data => '2010-04-28'    
    negocio.volume.should equal(200)
  end
  
  
end