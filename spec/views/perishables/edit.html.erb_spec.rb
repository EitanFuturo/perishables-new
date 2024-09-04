require 'rails_helper'

RSpec.describe "perishables/edit", type: :view do
  let(:perishable) {
    Perishable.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:perishable, perishable)
  end

  it "renders the edit perishable form" do
    render

    assert_select "form[action=?][method=?]", perishable_path(perishable), "post" do

      assert_select "input[name=?]", "perishable[name]"
    end
  end
end
