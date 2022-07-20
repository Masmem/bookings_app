require 'rails_helper'
require 'faker'

RSpec.describe BookingsHelper, type: :feature do
  include Devise::Test::IntegrationHelpers

  context "Usuário não autenticado" do
    describe "deve ser redirecionado para pagina de login" do
      it "ao acessar o root" do
        visit root_path
        expect(page).to have_selector("div", class: "login-container")  
      end
    end
  end

  context "Usuário autenticado" do
    before(:all) do
      loged_used = User.create(email: Faker::Internet.email,  )
    end
    
    describe "realizar logout no sistema" do
      it "ser redirecionado para tela de login" do
        
      end
      
      
    end
  end
end
  