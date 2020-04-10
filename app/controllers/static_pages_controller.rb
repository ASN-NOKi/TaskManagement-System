class StaticPagesController < ApplicationController
  def top
    @user = current_user
    puts params
  
  end
end
