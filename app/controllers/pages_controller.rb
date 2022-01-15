class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user = current_user
    @goals = Goal.all
    @total_invested = 0

    @goals.each do |goal|
      @total_invested += goal.amount if goal.user == current_user && goal.archived == false
    end

    @investment = @user.investment
    @percentage_completion = @invested.to_f / @investment * 100
  end

  def taxcalc
  end
end
