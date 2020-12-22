## TODO: check how to incorporate development and production stuff


namespace :db do
  namespace :seed do
    Dir[File.join(Rails.root, 'db', 'seeds', 'development', '*.rb')].each do |filename|
      task_name = File.basename(filename, '.rb').intern    
      task task_name => :environment do
        load(filename) if File.exist?(filename)
      end
    end
  end

  namespace :seed_prod do
    Dir[File.join(Rails.root, 'db', 'seeds', 'production', '*.rb')].each do |filename|
      task_name = File.basename(filename, '.rb').intern    
      task task_name => :environment do
        load(filename) if File.exist?(filename)
      end
    end
  end

  namespace :seed_qa do
    Dir[File.join(Rails.root, 'db', 'seeds', 'qa', '*.rb')].each do |filename|
      task_name = File.basename(filename, '.rb').intern    
      task task_name => :environment do
        load(filename) if File.exist?(filename)
      end
    end
  end
end
