class ListingsController < ApplicationController

    before_action :authenticate_user!, except: :index
    
    def index
        @listings = Listing.all
        if params[:user_id] 
            @listings = Listing.where(user_id: params[:user_id])
        end
    end

    def new
        @listing = Listing.new
    end

    def create
        @listing = current_user.listings.create(listing_params)
        if @listing.errors.any?
            render "new"
        else
            redirect_to root_path
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
            redirect_to root_path
        end


    end

    def update
        @listing = current_user.listings.find_by_id(params["id"])

        if @listing
            @listing.update(listing_params)
            if @listing.errors.any?
                render "edit"
            else
                redirect_to root_path
            end
        else
            redirect_to root_path
        end
    end

    def destroy
        @listing = current_user.listings.find_by_id(params["id"])

        if @listing
            @listing.destroy
        end
        redirect_to root_path
    end

    private
    def listing_params
        params.require(:listing).permit(:title, :model, :description, :size_id, :price, :location, :postcode, :availability, :picture, :size)
    end

end