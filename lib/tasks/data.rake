namespace :data do
  desc 'CSV importer for object state data'
  task import_changes: :environment do
    begin
      file = "#{Rails.root}/spec/sample_files/state_data.csv"	
      StateChange.import(file)
    rescue => e
      puts "Error => #{e.message}"
    end  
  end
end
