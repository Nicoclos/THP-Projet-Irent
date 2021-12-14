class StaticPagesController < ApplicationController
    def home
      @Items = Item.all
    end
  
end
  