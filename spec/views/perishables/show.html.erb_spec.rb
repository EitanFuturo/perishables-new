require 'rails_helper'

RSpec.describe "perishables/show", type: :view do
  before(:each) do
    assign(:perishable, Perishable.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
