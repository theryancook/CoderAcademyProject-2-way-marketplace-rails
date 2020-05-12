class ListingsController < ApplicationController
    before_action :authenticate_user! #actually want this for only when items get clicked on. Figure it out
    
    def index
        @listings = Listing.all
    end

    def new
        @listing = Listing.new
    end

    def create
        @listing = current_user.listings.create(listing_params)
        if @listing.errors.any?
            render "new"
        else
            redirect_to listings_path
        end
    end

    def show
        @listing = Listing.find(params["id"])
    end

    def edit
        @listing = current_user.listings.find_by_id(params["id"])

        if @listing
            render("edit")
        else
            redirect_to listings_path
        end
    end

    private
    def listing_params
        params.require(:listing).permit(:title, :model, :description, :size, :price, :locatoin, :postcode, :availabiity)
    end

end