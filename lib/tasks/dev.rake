namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do

    puts "Cadastrando tipos de medidas..."

    measures = %w(Unidade(UN) Litros(L) Metros(M))
    measures.each do |m|
      Measure.create!(
        measure: m
      )
    end
    puts "Medidas cadastradas com sucesso!"

    #Deve cadastrar os kinds antes dos contatos#

    puts "Cadastrando as categorias..."
    5.times do |i|
      Category.create!(
        category: Faker::Commerce.department
      )
    end
    puts "Categorias cadastradas com sucesso!"
  end
end
