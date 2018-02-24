RSpec.describe do
  describe 'filling out the survey for Chick-Fil-A', :type => :feature do
    it 'fills out a survey with a satisfied response' do
      validate_running_script_for 'cfa'
      visit 'https://www.mycfavisit.com'
      fill_in_cfa_confirmation_number
      fill_out_satisfied_single_question
      fill_out_satisfied_multi_question
      fill_out_satisfied_multi_question
      fill_out_satisfied_single_question
      single_yes_no_question_select_no
      fill_out_survey 'good visit. everything was correct'
      choose_option_from_single_question
      next_question
      next_question
      fill_out_satisfied_multi_question
      choose_options_from_multi_question
      next_question
      single_yes_no_question_select_no
      fill_in_email_address
      give_feedback_about_email
    end
  end

  def fill_in_cfa_confirmation_number
    process_survey_confirmation
    process_email_address
    fill_in 'CN1', with: @confirmation_split[0]
    fill_in 'CN2', with: @confirmation_split[1]
    fill_in 'CN3', with: @confirmation_split[2]
    fill_in 'CN4', with: @confirmation_split[3]
    fill_in 'CN5', with: @confirmation_split[4]
    click_on 'Start'
  end


end
