def next_question
  click_on('Next')
end

RSpec.describe do
  describe 'filling out the survey for McDonalds', :type => :feature do

    it 'fills out a survey with a satisfied response' do
      visit 'https://www.mcdvoice.com'
      fill_in_confirmation_number
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

  def fill_in_confirmation_number
    fill_in 'CN1', with: '12945'
    fill_in 'CN2', with: '13410'
    fill_in 'CN3', with: '20218'
    fill_in 'CN4', with: '13428'
    fill_in 'CN5', with: '00017'
    fill_in 'CN6', with: '4'
    click_on 'Start'
  end

  def choose_option_from_single_question
    option = find('div.Opt2.rbloption > span.radioButtonHolder > span.radioBranded')
    option.click
    next_question
  end

  def choose_options_from_multi_question
    options = find_all('div.Opt2.rbloption > span.radioButtonHolder > span.radioBranded')
    options.each do |opt| opt.click end
    next_question
  end

  def single_yes_no_question_select_no
    find('td.Opt2.inputtyperbloption > span.radioBranded').click
    next_question
  end

  def fill_out_multi_yes_no_question_with_yes
    yes_answers = find_all('td.Opt1.inputtyperbloption > span.radioBranded')
    yes_answers.each do |yes| yes.click end
    next_question
  end


  def fill_out_satisfied_single_question
    single = find('td.Opt5.inputtyperbloption > span.radioBranded')
    single.click
    next_question
  end

  def fill_out_satisfied_multi_question
    multi = find_all('td.Opt5.inputtyperbloption > span.radioBranded')
    multi.each do |hs| hs.click end
    next_question
  end

  def fill_out_survey comment
    find('#S081000').send_keys(comment)
    next_question
  end

  def next_question
    click_on('Next')
  end

  def print_out_validation_code
    puts find("p[class='ValCode']").text
  end

  def get_dashed_code restaurant
    puts "Please enter code from your #{restaurant} receipt, including dashes."
  end
end

