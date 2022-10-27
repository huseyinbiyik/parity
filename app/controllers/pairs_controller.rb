class PairsController < ApplicationController
  def display
    @pairs = Pair.all
  end

  def manage
    @currencies = Currency.all
  end

  def create
    @pair = Pair.new(pair_params)
    if @pair.save
      flash[:notice] = 'Pair created successfully.'
      redirect_to action: 'manage'
    else
      flash[:notice] = 'Pair creation failed.'
      redirect_to action: 'manage'
    end
  end

  def pair_params
    params.require(:pair).permit(:currency1_id, :currency2_id)
  end
end
