namespace :after_party do
  desc 'Deployment task: add_setting_to_all_users'
  task add_setting_to_all_users: :environment do
    puts "Running deploy task 'add_setting_to_all_users'"
    User.all.each do |user| 
      user.setting || Setting.create(user: user, locale: :en)
    end

    # Update task as completed.  If you remove the line below, the task will
    # run with every deploy (or every time you call after_party:run).
    AfterParty::TaskRecord
      .create version: AfterParty::TaskRecorder.new(__FILE__).timestamp
  end
end