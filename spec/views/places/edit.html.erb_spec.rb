# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'places/edit', type: :view do
  before(:each) do
    user = User.create(email: 'user23@user23.com', password: 'user23@user23.com', password_confirmation: 'user23@user23.com')
    @place = assign(:place, Place.create!(
                              name: 'MyString',
                              address: 'MyText',
                              creator: user
                            ))
  end

  it 'renders the edit place form' do
    render

    assert_select 'form[action=?][method=?]', place_path(@place), 'post' do
      assert_select 'input[name=?]', 'place[name]'

      assert_select 'input[name=?]', 'place[address]'
    end
  end
end
