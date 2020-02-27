# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Product', type: :system do
  context 'Product creation' do
    it 'creates the product' do
      visit new_product_path
      fill_in :product_name, with: 'Xbox One'
      fill_in :product_description, with: 'It is so fun to play with this!'
      fill_in :product_price, with: 500
      click_button 'Save as draft'

      expect(page).to(
        have_css('span.status', text: 'Draft')
      )
    end
  end

  context 'Product publication' do
    it 'cancels the product' do
      visit new_product_path
      fill_in :product_name, with: 'Xbox One'
      fill_in :product_description, with: 'It is so fun to play with this!'
      fill_in :product_price, with: 500
      click_button 'Publish'

      expect(page).to(
        have_css('span.status', text: 'Published')
      )
    end
  end
end
