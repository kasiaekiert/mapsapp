require 'rails_helper'

RSpec.describe Event, type: :model do
  context '#status' do
    it 'is incomming when started time is in the future' do 
      event = Event.create(name: 'Maraton', started_at: Time.current + 2.hours, duration: 1)
      expect(event.status).to eq(:incomming)
    end

    it 'is in progress when event has been starting and not finished yet' do 
      event = Event.create(name: 'Maraton', started_at: Time.current - 30.minutes, duration: 1)
      expect(event.status).to eq(:in_progress)
    end

    it 'is finished when event is finished' do 
      event = Event.create(name: 'Maraton', started_at: Time.current - 2.hours, duration: 1)
      expect(event.status).to eq(:finished)
    end
  end
end