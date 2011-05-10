require 'spec_helper'

describe "Um Candle" do
  it "o valor de abertura deve ser maior que 0" do
    lambda do
      Argentum::Candle.new :abertura=>-2,
      :fechamento => 50,
      :maximo => 60,
      :minimo => 10,
      :volume => 10000,
      :data => '2010-04-28'
    end.should raise_error(ArgumentError)
  end
  
  it "o valor de fechamento deve ser maior que 0" do
    lambda do
      Argentum::Candle.new :abertura=>2,
      :fechamento => -50,
      :maximo => 60,
      :minimo => 10,
      :volume => 10000,
      :data => '2010-04-28'
    end.should raise_error(ArgumentError)
  end
  
  it "o valor de maximo deve ser maior que 0" do
    lambda do
      Argentum::Candle.new :abertura=>2,
      :fechamento => 50,
      :maximo => -60,
      :minimo => 10,
      :volume => 10000,
      :data => '2010-04-28'
    end.should raise_error(ArgumentError)
  end
  
  it "o valor de minimo deve ser maior que 0" do
    lambda do
      Argentum::Candle.new :abertura=> 2,
      :fechamento => 50,
      :maximo => 60,
      :minimo => 0,
      :volume => 10000,
      :data => '2010-04-28'
    end.should raise_error(ArgumentError)
  end
  
  it "o valor de volume deve ser maior que 0" do
    lambda do
      Argentum::Candle.new :abertura=>2,
      :fechamento => 50,
      :maximo => 60,
      :minimo => 10,
      :volume => 0,
      :data => '2010-04-28'
    end.should raise_error(ArgumentError)
  end
  
  it "deve ter uma data" do
    lambda do
      Argentum::Candle.new :abertura=>2,
      :fechamento => 50,
      :maximo => 60,
      :minimo => 10,
      :volume => 10000
    end.should raise_error(ArgumentError)
  end
  
  it "deve ser imutavel" do
    candle = Argentum::Candle.new :abertura=>2,
      :fechamento => 50,
      :maximo => 60,
      :minimo => 10,
      :volume => 10000,
      :data => '2010-04-28'    
    lambda{ candle.abertura = 100 }.should raise_error(TypeError)
    lambda{ candle.fechamento = 800 }.should raise_error(TypeError)
    lambda{ candle.minimo = 1000 }.should raise_error(TypeError)
    lambda{ candle.maximo = 20 }.should raise_error(TypeError)
    lambda{ candle.volume = 8 }.should raise_error(TypeError)
    lambda{ candle.data = DateTime.parse('2010-04-30') }.should raise_error(TypeError)
  end
  
end
