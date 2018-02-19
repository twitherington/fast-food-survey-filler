RSpec.describe do
  describe 'filling out the survey for McDonalds', :type => :feature do
    it 'fills out a survey with a satisfied response' do
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
      choose_option_from_single_question
      single_yes_no_question_select_no
      single_yes_no_question_select_no
      choose_options_from_multi_question
      fill_out_satisfied_single_question
      next_question
      print_out_validation_code
    end
  end

  def fill_in_mcd_confirmation_number
    fill_in 'CN1', with: '12945'
    fill_in 'CN2', with: '13410'
    fill_in 'CN3', with: '20218'
    fill_in 'CN4', with: '13428'
    fill_in 'CN5', with: '00017'
    fill_in 'CN6', with: '4'
    click_on 'Start'
  end
end
