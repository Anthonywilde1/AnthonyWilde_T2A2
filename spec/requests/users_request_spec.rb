require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe "GET index" do 

        it "200 the index page" do
            expect(response.status).to eq(200)
        end

        it "does not render other templates" do
            expect(response).to_not render_template(:show)
        end
    end

    describe "GET show" do

        it "200 the show page" do
            expect(response.status).to eq(200)
        end

        it "doesn't render other pages" do
            expect(response).to_not render_template(:index)
        end
    end

    describe "GET edit" do

        it "200 the edit page" do
            expect(response.status).to eq(200)
        end

        it "does not 404 the edit page" do
            expect(response.status).to_not eq(404)
        end
    end

    describe "PATCH update" do

        it "eq 200" do
            expect(response.status).to eq(200)
        end
    end
end
