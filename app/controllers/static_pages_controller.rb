class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      render 'dashboard.html.haml'
    else
      render 'home.html.haml'
    end
  end

  def dashboard
  end
end
