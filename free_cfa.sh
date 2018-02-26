#!/bin/bash

echo Hello, what is your Chick-Fil-A survey code \(with hyphens\) from your receipt?
read surveycode
echo What is the email address you would like the offer sent to?
read email
CODE=$surveycode EMAIL=$email rspec spec/chick-fil-a/cfa_survey_spec.rb
