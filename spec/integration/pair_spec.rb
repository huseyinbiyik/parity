# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Pair', type: :system do
  describe 'Display Page' do
    it 'displays a list of pairs and their rates' do
      visit '/'
      expect(page).to have_content('Currency1')
      expect(page).to have_content('Currency2')
      expect(page).to have_content('Rate')
    end
  end
  describe 'Manage Page' do
    before do
      currency1 = Currency.create(name: 'EUR', rate: 1)
      currency2 = Currency.create(name: 'TRY', rate: 20)
      Pair.create(currency1_id: currency1.id, currency2_id: currency2.id)
    end
    it 'displays add pair button' do
      visit '/pairs/manage'
      expect(page).to have_selector('input[value="+ADD PAIR"]')
    end
    it 'creates a new pair' do
      visit '/pairs/manage'
      select 'EUR', from: 'pair_currency1_id'
      select 'TRY', from: 'pair_currency2_id'
      click_button '+ADD PAIR'
      expect(page).to have_content('EUR')
      expect(page).to have_content('TRY')
      expect(page).to have_content('Pair created successfully.')
    end
  end
end
