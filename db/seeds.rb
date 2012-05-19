require 'csv'

Party.destroy_all
Party::CODES.each do |code, name|
  Party.create!(
    :name => name,
    :code => code
  )
end

Constituency.destroy_all
Candidate.destroy_all
CSV.open(Rails.root + 'db/seeds/constituencies.seeds.csv', :headers => true).each do |row|
  raise RuntimeError, 'Invalid party %s!' % row['Win05'] unless party = Party.where(:name => row['Win05']).first || Party.where(:code => row['Win05']).first
  constituency = Constituency.create!(
    :pa_id => row['RefNo'],
    :name => row['Seat'],
    :region => row['Region'],
    :party => party
  )

  Party.all.each do |party|
    if name = (row['%sPPC' % party.code] || row['%sPPC10' % party.code]) # there's some inconsistency in row naming in source spreadsheet
      constituency.candidates << Constituency::Candidate.new(
        :name => name, 
        :party => party
      )
    end
  end
end

# For RailsAdmin
User.destroy_all
User.create!(:email => 'admin@example.com', :password => 'password')