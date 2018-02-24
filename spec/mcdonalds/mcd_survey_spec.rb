RSpec.describe do
  describe 'filling out the survey for McDonalds', :type => :feature do
    it 'fills out a survey with a satisfied response' do
      validate_running_script_for 'mcds'
      visit 'https://www.mcdvoice.com'
      fill_in_mcd_confirmation_number
      choose_option_from_single_question
      fill_out_satisfied_single_question
      fill_out_satisfied_multi_question
      fill_out_satisfied_multi_question
      single_yes_no_question_select_no
      fill_out_satisfied_multi_question
      fill_out_survey 'good visit. everything was correct'
      fill_out_multi_yes_no_question_with_yes
      choose_option_from_single_question
      fill_out_multi_yes_no_question_with_yes
      choose_option_from_single_question
      choose_option_from_single_question
      fill_out_satisfied_single_question
      # choose_option_from_single_question
      single_yes_no_question_select_no
      single_yes_no_question_select_no
      choose_options_from_multi_question
      fill_out_satisfied_single_question
      next_question
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
