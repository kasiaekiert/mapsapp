# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'places/show', type: :view do
  before(:each) do
    user = User.create(email: 'user23@user23.com', password: 'user23@user23.com', password_confirmation: 'user23@user23.com')
    @place = assign(:place, Place.create!(
                              name: 'Name',
                              address: 'MyText',
                              creator: user
                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
