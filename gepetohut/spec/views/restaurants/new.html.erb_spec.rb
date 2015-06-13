require 'rails_helper'

RSpec.describe "restaurants/new", type: :view do
  before(:each) do
    assign(:restaurant, Restaurant.new(
      :name => "MyString",
      :qtd_delivery => 1,
      :qtd_pizzaiolo => 1,
      :qtd_income => 1.5,
      :qtd_expense => 1.5,
      :rating => 1
    ))
  end

  it "renders new restaurant form" do
    render

    assert_select "form[action=?][method=?]", restaurants_path, "post" do

      assert_select "input#restaurant_name[name=?]", "restaurant[name]"

      assert_select "input#restaurant_qtd_delivery[name=?]", "restaurant[qtd_delivery]"

      assert_select "input#restaurant_qtd_pizzaiolo[name=?]", "restaurant[qtd_pizzaiolo]"

      assert_select "input#restaurant_qtd_income[name=?]", "restaurant[qtd_income]"

      assert_select "input#restaurant_qtd_expense[name=?]", "restaurant[qtd_expense]"

      assert_select "input#restaurant_rating[name=?]", "restaurant[rating]"
    end
  end
end