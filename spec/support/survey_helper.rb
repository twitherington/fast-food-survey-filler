module SurveyHelper
  def validate_running_script_for fast_food
    if ENV['CODE'] == nil
      puts '*** Please run the following command ***'
      puts "./script/free_#{fast_food}.sh"
      exit(false)
    end
  end

  def process_survey_confirmation
    if ENV['CODE'].gsub('-', '').scan(/\D/).empty?
      @confirmation_split = ENV['CODE'].chomp.split('-').to_a
    else
      puts '*** Please enter a valid survey confirmation ***'
      exit(false)
    end
  end

  def process_email_address
    valid_email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    unless (ENV['EMAIL'] =~ valid_email_regex) != 0
      puts '*** Please enter a valid email address ***'
    end
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

  def single_yes_no_question_select_yes
    find('td.Opt1.inputtyperbloption > span.radioBranded').click
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
    find('textarea').send_keys(comment)
    next_question
  end

  def next_question
    click_on('Next')
  end

  def fill_out_classification_survey
    select('Prefer not to answer', from: 'Please indicate your gender:')
    select('Prefer not to answer', from: 'Please indicate your age:')
    select('Prefer not to answer', from: 'Please indicate your annual household income:')
    select('Prefer not to answer', from: 'Please indicate which of the following best describes your background:')
    next_question
  end

  def print_out_validation_code
    puts find("p[class='ValCode']").text + '   <- Please write this on your receipt, and enjoy your deal!'
  end

  def fill_in_email_address
    email = ENV['EMAIL']
    fill_in 'E-mail Address:', with: email
    fill_in 'Confirm E-mail:', with: email
    next_question
  end

  def get_dashed_code restaurant
    puts "Please enter code from your #{restaurant} receipt, including dashes."
  end

end
