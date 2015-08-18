class TvsController < ApplicationController
  def filter
  end
  def result
    @data = Bestbuy.all
  end
  def product
    @data = Bestbuy.all
  end
end

