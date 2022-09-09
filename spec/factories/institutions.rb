FactoryBot.define do
  factory :institution do
    name FFaker::InternetSE.company_name_single_word
    cnpj FFaker::IdentificationBR.cnpj
    kind "university"
  end
end
