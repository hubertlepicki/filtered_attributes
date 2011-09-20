class AdvancedFiltersController < ApplicationController
  filter_attributes_for :account, allow: [:email], only: [:create]
  filter_attributes_for :account, allow: [:admin], only: [:update]
  filter_attributes_for :account, allow: [:email], except: [:create, :update],
    attributes_hash: ->(params) { params[:foo][:bar][:account] }

  def create
    pass account_attributes
  end

  def update
    pass account_attributes
  end

  def foo
    pass account_attributes
  end
end
