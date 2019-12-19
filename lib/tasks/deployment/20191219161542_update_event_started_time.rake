namespace :after_party do
  desc 'Deployment task: update_event_started_time'
  task update_event_started_time: :environment do
    puts "Running deploy task 'update_event_started_time'"

    Event.all.each do |event|
      event.update(started_at: Time.current) unless event.started_at
      event.update(duration: 1) unless event.duration
    end

    # Update task as completed.  If you remove the line below, the task will
    # run with every deploy (or every time you call after_party:run).
    AfterParty::TaskRecord
      .create version: AfterParty::TaskRecorder.new(__FILE__).timestamp
  end
end