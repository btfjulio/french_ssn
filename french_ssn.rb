# frozen_string_literal: true

require 'yaml'
require 'pry'

SSN_PATTERN = /^(?<gender>[12])\s(?<year>\d{2})\s(?<month>\d{2})\s(?<department>\d{2})(\s\d{3}){2}\s(?<digit>\d{2})$/

def french_ssn_info(ssn)
  matched = ssn.match(SSN_PATTERN)
  if matched
    gender = matched[:gender] == '1' ? 'man' : 'woman'

  else
    'The number is invalid'
  end
end

def departments
  departments = YAML.open_file('./data/french_departments.yml')

  binding.pry
end

departments
