class PairsController < ApplicationController
  def display
    @pairs = Pair.all.includes(:currency1, :currency2)
  end

  def manage
    @currencies = Currency.all
    @pairs = Pair.all.includes(:currency1, :currency2)
  end

  def destroy
    @pair = Pair.find(params[:id])
    @pair.destroy
    redirect_to pairs_manage_path
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
