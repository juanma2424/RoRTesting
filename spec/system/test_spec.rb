require "rails_helper"
RSpec.describe "employeeCRUD", type: :system, js: true, driver: :selenium_chrome do

 time = 2
 
 scenario "add employee successfully" do
    visit "/employees"
    click_link "Create New Employee"
    fill_in "employee[name]", with: "JuanMa"
    fill_in "employee[lastname]", with: "fs"
    fill_in "employee[address]", with: "Cartago"
    fill_in "employee[phone]", with: "888"
    fill_in "employee[salary]", with: "1000"
    click_button "Save"
    expect(page).to have_text("JuanMa")
  end

  describe "show" do
    let!(:employee) {FactoryBot.create(:employee)}
    scenario 'show employee' do
        visit "/employees"
        click_link 'Show'
        expect(page).to have_text(employee.name)
        expect(page).to have_text(employee.lastname)
        expect(page).to have_text(employee.address)
        expect(page).to have_text(employee.phone)
        expect(page).to have_text(employee.salary)
        sleep time
    end
end

  describe "update" do
      let!(:employee) {FactoryBot.create(:employee)}
      let(:employee_edit) {FactoryBot.build_stubbed(:employee)}
      scenario 'edit employee successfully' do
          visit "/employees"
          click_link 'Edit'
          fill_in 'employee[name]', with: employee_edit.name
          fill_in 'employee[lastname]',with:employee_edit.lastname
          fill_in 'employee[address]', with:employee_edit.address
          fill_in 'employee[phone]', with:employee_edit.phone
          fill_in 'employee[salary]', with:employee_edit.salary
          sleep time
          click_button 'Save'
          expect(page).to have_text("JuanMa")
      end
  end


  describe "delete" do
    let!(:employee) {FactoryBot.create(:employee)}
    let(:employee_edit) {FactoryBot.build_stubbed(:employee)}
    scenario 'delete employee successfully' do
        visit "/employees"
        click_link 'Delete'
        click_button 'Ok'
        sleep time
    end
end


  describe "validation" do
     let!(:employee) { FactoryBot.create(:employee) }
     let(:employee_edit) { FactoryBot.build_stubbed(:employee) }
     
     scenario "edit employee validation name" do
      visit "/employees"
      click_link "Create New Employee"
      #fill_in "employee[name]", with:''
      fill_in "employee[lastname]", with: employee_edit.lastname
      fill_in "employee[address]", with: employee_edit.address
      fill_in "employee[phone]", with: employee_edit.phone
      fill_in "employee[salary]", with: employee_edit.salary
      sleep time
      click_button "Save"
      expect(page).to have_text("Name can't be blank")
    end

    scenario "edit employee validation lastname" do
        visit "/employees"
        click_link "Create New Employee"
        fill_in "employee[name]", with:employee_edit.lastname
        #fill_in "employee[lastname]", with: employee_edit.lastname
        fill_in "employee[address]", with: employee_edit.address
        fill_in "employee[phone]", with: employee_edit.phone
        fill_in "employee[salary]", with: employee_edit.salary
        sleep time
        click_button "Save"
        expect(page).to have_text("LastName can't be blank")
    end

    scenario "edit employee validation address" do
        visit "/employees"
        click_link "Create New Employee"
        fill_in "employee[name]", with:employee_edit.lastname
        fill_in "employee[lastname]", with: employee_edit.lastname
        #fill_in "employee[address]", with: employee_edit.address
        fill_in "employee[phone]", with: employee_edit.phone
        fill_in "employee[salary]", with: employee_edit.salary
        sleep time
        click_button "Save"
        expect(page).to have_text("Address can't be blank")
    end

    scenario "edit employee validation phone" do
        visit "/employees"
        click_link "Create New Employee"
        fill_in "employee[name]", with:employee_edit.lastname
        fill_in "employee[lastname]", with: employee_edit.lastname
        fill_in "employee[address]", with: employee_edit.address
        #fill_in "employee[phone]", with: employee_edit.phone
        fill_in "employee[salary]", with: employee_edit.salary
        sleep time
        click_button "Save"
        expect(page).to have_text("Phone can't be blank")
    end


    scenario "edit employee validation salary" do
        visit "/employees"
        click_link "Create New Employee"
        fill_in "employee[name]", with:employee_edit.lastname
        fill_in "employee[lastname]", with: employee_edit.lastname
        fill_in "employee[address]", with: employee_edit.address
        fill_in "employee[phone]", with: employee_edit.phone
        #fill_in "employee[salary]", with: employee_edit.salary
        sleep time
        click_button "Save"
        expect(page).to have_text("Salary can't be blank")
    end

    scenario "edit employee validation salaryType" do
        visit "/employees"
        click_link "Create New Employee"
        fill_in "employee[name]", with:employee_edit.lastname
        fill_in "employee[lastname]", with: employee_edit.lastname
        fill_in "employee[address]", with: employee_edit.address
        fill_in "employee[phone]", with: employee_edit.phone
        fill_in "employee[salary]", with: employee_edit.phone
        sleep time
        click_button "Save"
        expect(page).to have_text("Salary is not a number")
    end
  end

end
