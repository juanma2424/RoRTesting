require 'rails_helper'
RSpec.describe 'employeeCRUD', type: :system, js: true, driver: :selenium_chrome do
    
    scenario 'add employee successfully' do
        visit "/employees"
        click_link 'Create New Employee'
        fill_in 'employee[name]', with:'JuanMa'
        fill_in 'employee[lastname]', with:'fs'
        fill_in 'employee[address]', with:'Cartago'
        fill_in 'employee[phone]', with:'888'
        fill_in 'employee[salary]', with:'1000'
        click_button 'Save'
        expect(page).to have_text("JuanMa")
    end

    describe "update" do
        let!(:employee) {FactoryBot.create(:employee)}
        let(:employee_edit) {FactoryBot.build_stubbed(:employee)}
        scenario 'edit employee successfully' do
            visit "/employees"
            click_link 'Edit'
            fill_in 'employee[name]', with: employee_edit.name
            fill_in 'employee[lastname]', with:'fs'
            fill_in 'employee[address]', with:'Cartago'
            fill_in 'employee[phone]', with:'888'
            fill_in 'employee[salary]', with:'1000'
            sleep 3
            click_button 'Save'
            expect(page).to have_text("JuanMa")
        end
    end
    
 end