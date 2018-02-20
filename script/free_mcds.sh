#!/bin/bash

echo Hello, what is your McDonald\'s survey code \(with hyphens\) from your receipt?
read surveycode
CODE=$surveycode rspec spec/mcdonalds/mcd_survey_spec.rb
