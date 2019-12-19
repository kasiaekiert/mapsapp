require 'rails_helper'

RSpec.describe Event, type: :model do
  context '#status' do
    it 'is incomming when started time is in the future' do 
      event = Event.create(name: 'Maraton', started_at: Time.current+2.hours, duration: 1)
      expect(event.status).to eq(:incomming)
    end
  end
end
