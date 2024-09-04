require 'rails_helper'

RSpec.describe "perishables/new", type: :view do
  before(:each) do
    assign(:perishable, Perishable.new(
      name: "MyString"
    ))
  end

  it "renders new perishable form" do
    render

    assert_select "form[action=?][method=?]", perishables_path, "post" do

      assert_select "input[name=?]", "perishable[name]"
    end
  end
end
