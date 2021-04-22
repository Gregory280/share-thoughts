require 'rails_helper'

RSpec.describe "testes/index", type: :view do
  before(:each) do
    assign(:testes, [
      Teste.create!(
        title: "Title"
      ),
      Teste.create!(
        title: "Title"
      )
    ])
  end

  it "renders a list of testes" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
  end
end
