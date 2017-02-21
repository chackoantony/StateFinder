namespace :data do
  desc 'CSV importer for object state data'
  task import_changes: :environment do
    begin
      StateChange.import(ENV['path'])
    rescue => e
      puts "Error => #{e.message}"
    end  
  end
end
