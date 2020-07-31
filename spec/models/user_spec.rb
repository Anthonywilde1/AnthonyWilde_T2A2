require 'rails_helper'

RSpec.describe User, type: :model do

  context "List all Users" do
    it "will assign all users to variable" do
    users = User.all
    expect(users).to eq(User.all)
    end
  end

  #also proves create works
  context "Find a User" do
    it "Will find a single User by :id" do
      a = User.create(username: "Anfiilooksgood", email: "Anthony1@anthony.com", password: "111111111")
      user1 = User.find(a.id)
      expect(user1).to eq(User.find(a.id))
      #i dont know why the fuck it wouldnt find it object id @ 1 but it finds a.id which is 1? Pardon my French
    end
  end

  context "Update user" do
    it "will change a Users Username" do
      a = User.create(username: "Anfiilooksgood", email: "Anthony1@anthony.com", password: "111111111")
      user1 = User.find(a.id)
      name = user1.update(username: "MynameJeff")
      expect(name).to eq(true)
      #true means that the variable exists  which means it updated
    end
  end


  
end
