require 'rails_helper'

RSpec.describe BookingsHelper, type: :feature do
    describe "Usuário não autenticado" do
        it "deve ser redirecionado para pagina de login" do
          visit root_path
    
        #   expect(page).should have_selecto("div#login_container")   
          should have_selector('div#login_container')  
        end
    end
end
  