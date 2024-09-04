require 'rails_helper'

RSpec.describe "perishables/index", type: :view do
  before(:each) do
    assign(:perishables, [
      Perishable.create!(
        name: "Name"
      ),
      Perishable.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of perishables" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end
