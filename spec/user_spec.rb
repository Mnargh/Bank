require 'user'



describe User do
  let(:user){User.new("Tom")}

  it "Should initialise with a name" do
    expect(user.name).to eq ("Tom")
  end
end
