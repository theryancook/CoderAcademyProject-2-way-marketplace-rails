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
        generate_stripe_session
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

    def generate_stripe_session
        session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: [{
            name: @listing.title,
            description: @listing.description,
            amount: @listing.price,
            currency: 'aud',
            quantity: 1,
        }],
        payment_intent_data: {
            metadata: {
                user_id: current_user.id,
                listing_id: @listing.id
            }
        },
        success_url: "#{root_url}payment",
        cancel_url: "#{root_url}listings"
    )

    @session_id = session.id
    end
end