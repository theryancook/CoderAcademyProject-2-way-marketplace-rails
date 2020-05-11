class ListingsController < ApplicationController
    before_action :authenticate_user! #actually want this for only when items get clicked on. Figure it out
    
    def index
        @listings = Listing.all
    end
end