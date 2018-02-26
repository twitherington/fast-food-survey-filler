#!/bin/bash

echo Hello, what is your DQ survey code \(with hyphens\) from your receipt?
read surveycode
CODE=$surveycode rspec spec/dairy_queen/dairy_queen_survey_spec.rb
