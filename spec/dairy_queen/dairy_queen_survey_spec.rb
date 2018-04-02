RSpec.describe do
  describe 'filling out the survey for Dairy Queen', :type => :feature do
    it 'fills out a survey with a satisfied response' do
      validate_running_script_for 'dq'
      visit 'https://www.dqfansurvey.com'
      fill_in_dq_confirmation_number
      expired_dq_survey
      single_yes_no_question_select_yes
      fill_out_satisfied_single_question
      choose_option_from_single_question
      next_question
      fill_out_satisfied_multi_question
      fill_out_satisfied_multi_question
      single_yes_no_question_select_no
      fill_out_satisfied_multi_question
      fill_out_survey 'good visit. everything was correct'
      fill_out_multi_yes_no_question_with_yes
      fill_out_satisfied_single_question
      choose_option_from_single_question
      choose_option_from_single_question
      choose_option_from_single_question
      fill_out_classification_survey
      print_out_validation_code
    end
  end

  def fill_in_dq_confirmation_number
    process_survey_confirmation
    fill_in 'CN1', with: @confirmation_split[0]
    fill_in 'CN2', with: @confirmation_split[1]
    fill_in 'CN3', with: @confirmation_split[2]
    click_on 'Start'
  end

  def expired_dq_survey
    if page.has_content?('Thank you for your interest in our survey. Unfortunately, we are unable to continue the survey based on the information you entered.') == true
      puts 'Sorry, your survey code is expired. You have 3 days from the time of purchase to complete the survey.'
      exit(false)
    end
  end
end
