require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe "GET show" do

        it "200 the show page" do
            expect(response.status).to eq(200)
        end

        it "does not 404 the edit page" do
            expect(response.status).to_not eq(404)
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

    describe "GET new" do

        it "200 the new page" do
            expect(response.status).to eq(200)
        end

        it "does not 404 the edit page" do
            expect(response.status).to_not eq(404)
        end
    end

    describe "POST create" do

        it "200 the create response" do
            expect(response.status).to eq(200)
        end

        it "does not 404 the create response" do
            expect(response.status).to_not eq(404)
        end
    end
    describe "PATCH update" do

        it "eq 200" do
            expect(response.status).to eq(200)
        end
    end
end
