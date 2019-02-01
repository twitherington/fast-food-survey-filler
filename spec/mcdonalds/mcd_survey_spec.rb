RSpec.describe do
  describe 'filling out the survey for McDonalds', :type => :feature do
    it 'fills out a survey with a satisfied response' do
      validate_running_script_for 'mcds'
      visit 'https://www.mcdvoice.com'
      fill_in_mcd_confirmation_number
      choose_option_2
      choose_option_5
      choose_option_5
      choose_option_5
      choose_option_5
      choose_option_2
      choose_option_5
      next_question
      choose_option_2
      choose_option_5
      next_question
      choose_option_2
      choose_option_2
      choose_option_2
      print_out_validation_code
    end
  end

  def fill_in_mcd_confirmation_number
    process_survey_confirmation
    fill_in 'CN1', with: @confirmation_split[0]
    fill_in 'CN2', with: @confirmation_split[1]
    fill_in 'CN3', with: @confirmation_split[2]
    fill_in 'CN4', with: @confirmation_split[3]
    fill_in 'CN5', with: @confirmation_split[4]
    fill_in 'CN6', with: @confirmation_split[5]
    click_on 'Start'
  end


end
