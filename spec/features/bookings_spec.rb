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
      @loged_used = User.create(email: Faker::Internet.email, name: Faker::name, password: "teste" )
    end

    before(:each) do
      sign_in @loged_used
    end
    
    describe "realizar logout no sistema" do
      it "ser redirecionado para tela de login" do
        visit root_path
        find(:css,"#email_dropdown_link").click
        find(:css, "#logout_link").click
        expect(page).to have_selector("div", class: "login-container")        
      end 
    end

    describe "acessar tela inicial" do
      it "deve ixibir mensagem de boas-vindas" do
        visit root_path
        expect(page).to have_selector("div", id: "welcome-title")
      end
    end

    
  end
end
  