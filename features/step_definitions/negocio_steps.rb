Dado /^um negocio de preco "([^\"]*)", valor "([^\"]*)" e data "([^\"]*)"$/ do |preco, quantidade, data|
  @negocio = Argentum::Negocio.new({:preco=>preco, :quantidade=>quantidade, :data=>data})
end

Quando /^altero o "([^\"]*)" para "([^\"]*)"$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Entao /^devo ver um erro$/ do
  pending # express the regexp above with the code you wish you had
end
