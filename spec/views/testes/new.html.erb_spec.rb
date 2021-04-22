require 'rails_helper'

RSpec.describe "testes/new", type: :view do
  before(:each) do
    assign(:teste, Teste.new(
      title: "MyString"
    ))
  end

  it "renders new teste form" do
    render

    assert_select "form[action=?][method=?]", testes_path, "post" do

      assert_select "input[name=?]", "teste[title]"
    end
  end
end
