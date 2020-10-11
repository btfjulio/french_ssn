require_relative "../french_ssn"

describe "#french_ssn_info" do
  it "it should return invalid when a wrong number is sent" do
    result = french_ssn_info("123")

    expect(result).to eq('The number is invalid')
  end
  
  it "it should return a man, born in December, 1984 in Seine-Maritime." do
    result = french_ssn_info("1 84 12 76 451 089 46")

    expect(result).to eq("a man, born in December, 1984 in Seine-Maritime.")
  end
end