require 'rails_helper'

RSpec.describe User, type: :model do
  it "user is valid" do
    user = User.new(
      name: "Luciano",
      email: "luciano@teste.com",
      phone: "9000009090",
      avatar: fixture_file_upload(Rails.root.join("spec", "support", "test-avatar.png"), "image/png"),
      password: "123456"
    )

    expect(user).to be_valid
  end

  it "user is not valid" do

    user = User.new(
      name: "Luciano",
      email: "luciano@teste.com",
      phone: "9000009090",
      password: "123456"
    )

    expect(user).to_not be_valid

  end

  it "user should have a name" do

    user = User.new(
      email: "luciano@teste.com",
      phone: "9000009090",
      password: "123456",
      avatar: fixture_file_upload(Rails.root.join("spec", "support", "test-avatar.png"), "image/png"),
    )

    expect(user).to_not be_valid

  end
end
