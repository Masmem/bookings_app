require 'rails_helper'

RSpec.describe BookingsHelper, type: :feature do
    describe "Usuário não autenticado deve ser redirecionado para pagina de login" do
        it "ao acessar o root" do
          visit root_path
          expect(page).to have_selector("div", class: "login-container")  
        end
    end
end
  