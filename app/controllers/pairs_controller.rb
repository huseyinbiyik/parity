class PairsController < ApplicationController
  def display
    @pairs = Pair.all
  end
end
