Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :student, :bill, :institution, :enrollment
    end
  end
end
