# frozen_string_literal: true

require 'yaml'
require 'pry'
require 'date'

SSN_PATTERN = /^(?<gender>[12])\s(?<year>\d{2})\s(?<month>\d{2})\s(?<department>\d{2})(\s\d{3}){2}\s(?<digit>\d{2})$/

def french_ssn_info(ssn)
  matched = ssn.match(SSN_PATTERN)
  if matched && is_valid?(matched[0])
    gender = matched[:gender] == '1' ? 'man' : 'woman'
    department = departments[matched[:department]]
    month = Date::MONTHNAMES[matched[:month].to_i] 
    year = matched[:year] 

    "a #{gender}, born in #{month}, 19#{year} in #{department}."
  else
    'The number is invalid'
  end
end

def is_valid?(number)
  parsed_number = number.gsub(/\s/,'')[0..-3].to_i
  ((97 - parsed_number) % 97) == 46
end

def departments
  YAML.load_file('./data/french_departments.yml')
end
