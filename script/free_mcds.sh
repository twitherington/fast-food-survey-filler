#!/bin/bash
set -e

bundle install
rspec spec/mcdonalds/mcd_survey_spec.rb
