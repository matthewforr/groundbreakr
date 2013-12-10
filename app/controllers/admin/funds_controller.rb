module Admin
  class FundsController < ApplicationController
    before_filter :admin_required

    def index
      @funds = Fund.all.sort_by{|a| a.raised_amount}.first(3)
      respond_to do |format|
        format.html
        format.json { render json: @funds }
      end
    end
  end
end