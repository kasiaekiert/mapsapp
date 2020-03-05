# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'places/new', type: :view do
  before(:each) do
    user = User.create(email: 'user23@user23.com', password: 'user23@user23.com', password_confirmation: 'user23@user23.com')
    assign(:place, Place.new(
                     name: 'MyString',
                     address: 'MyText',
                     creator: user
                   ))
  end

  it 'renders new place form' do
    render

    assert_select 'form[action=?][method=?]', places_path, 'post' do
      assert_select 'input[name=?]', 'place[name]'

      assert_select 'input[name=?]', 'place[address]'
    end
  end
end
