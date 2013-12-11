class WelcomeController < ApplicationController

  def index
    @funds = Fund.all.sort_by{|a| a.raised_amount}.last(3)
    @completed_funds= Fund.all.sort_by{|a| a.raised_amount}.first(3)

    if current_user
      update_progress_bar
    end
  end
end
