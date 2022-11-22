# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'drinks/filter_by' => 'drinks#filter_by'
  get 'drinks/list_options' => 'drinks#list_options'
  get 'drinks' => 'drinks#index'
end
