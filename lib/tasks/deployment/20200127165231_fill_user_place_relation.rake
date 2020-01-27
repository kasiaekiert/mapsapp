namespace :after_party do
  desc 'Deployment task: fill_user_place_relation'
  task fill_user_place_relation: :environment do
    puts "Running deploy task 'fill_user_place_relation'"
    user_id = User.find_by(id: 4).try(:id) || User.create(email: 'email@email.com', password: 'password').id

    Place.all.each do |place|
      place.update(user_id: user_id)
    end
    # Update task as completed.  If you remove the line below, the task will
    # run with every deploy (or every time you call after_party:run).
    AfterParty::TaskRecord
      .create version: AfterParty::TaskRecorder.new(__FILE__).timestamp
  end
end