# frozen_string_literal: true

class HomeController < ApplicationController
  def top
    render :layout => 'home'
  end
end
