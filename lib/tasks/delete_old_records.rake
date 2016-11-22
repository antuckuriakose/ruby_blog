namespace :delete do
  desc 'Delete records older than 60 days'
  task :old_records => :environment do
    Article.where('id < ?', 25).each do |model|
      if model.destroy
        puts "Succesfully removed"
      else
        puts "Not removed"
      end
    end

    # or Model.delete_all('created_at < ?', 60.days.ago) if you don't need callbacks
  end

  task :old_users => :environment do
    User.where('sign_in_count < ? AND created_at< ?', 25, 3.days.ago).each do |model|
      if model.destroy
        puts "Succesfully removed"
      else
        puts "Not removed"
      end
    end

    # or Model.delete_all('created_at < ?', 60.days.ago) if you don't need callbacks
  end
end
