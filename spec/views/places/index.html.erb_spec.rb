# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'places/index', type: :view do
  before(:each) do
    user = User.create(email: 'user23@user23.com', password: 'user23@user23.com', password_confirmation: 'user23@user23.com')
    sign_in user
    assign(:places, [
             Place.create!(
               name: 'Name',
               address: 'MyText',
               creator: user
             ),
             Place.create!(
               name: 'Name',
               address: 'MyText',
               creator: user
             )
           ])
  end

  it 'renders a list of places' do
    render
    assert_select 'div.container>div.row>div.col-md-4>h2', text: 'Name'.to_s, count: 2
  end
end
