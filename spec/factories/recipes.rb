FactoryGirl.define do
  factory :recipe do
    name 'Pudim de Leite'
    kitchen 'Portuguesa'
    type_of_food 'Sobremesa'
    food_preference 'Sem gluten'
    amount_people 5
    preparation_time 45
    difficulty 'Médio'
    ingredients '1 Leite Condensado, 1 lata de Leite Longa Vida, 4 gemas'
    preparation 'Bata todos os ingredientes no liquidificador, após coloque o
                 creme em uma forma untada com melado (açúcar derretido com
                 água) e leve ao banho-maria por 40 minutos. Sirva frio.'
    before :create do |recipe|
      recipe.foto_file_name = 'Pudim.JPG'
      recipe.foto_content_type = 'image/jpeg'
      recipe.foto_file_size = 2588
      recipe.foto_updated_at = Time.zone.now
    end
  end
end
