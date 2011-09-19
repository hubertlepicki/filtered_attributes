class AdvancedFiltersController < ApplicationController
  filter_attributes_for :account, allow: [:email], only: [:create]
  filter_attributes_for :account, allow: [:admin], except: [:create]

  def create
    pass account_attributes
  end

  def update
    pass account_attributes
  end
end
