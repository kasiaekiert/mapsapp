# frozen_string_literal: true

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

  context '#sort_by' do
    it 'should have the right events in the right order' do
      @event1 = Event.create(name: 'Event1', started_at: Time.current + 7.weeks, duration: 1)
      @event2 = Event.create(name: 'Event2', started_at: Time.current, duration: 1)
      expect(Event.all).to contain_exactly(@event2, @event1)
      # (Event.where(started_at: 'admin').to_a
      # expect([@event1, @event2]).to start_with(@event2)
      # Event.all.sort_by_started_at.expect.start(@event2, @event1)
    end
  end
end
