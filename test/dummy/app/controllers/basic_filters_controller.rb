class BasicFiltersController < ApplicationController
  filter_attributes_for :user, allow: [:email]

  def create
    pass user_attributes
  end
end
