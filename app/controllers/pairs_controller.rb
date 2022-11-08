# frozen_string_literal: true

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
    flash[:notice] = 'Pair deleted successfully.'
  end

  def create
    @pair = Pair.new(pair_params)
    if @pair.save
      flash[:notice] = 'Pair created successfully.'
    else
      flash[:alert] = 'Pair creation failed.'
    end
    redirect_to action: 'manage'
  end

  def pair_params
    params.require(:pair).permit(:currency1_id, :currency2_id)
  end
end
