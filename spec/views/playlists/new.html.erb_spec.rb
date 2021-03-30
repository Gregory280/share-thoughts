require 'rails_helper'

RSpec.describe "playlists/new", type: :view do
  before(:each) do
    assign(:playlist, Playlist.new(
      title: "MyString",
      user: nil
    ))
  end

  it "renders new playlist form" do
    render

    assert_select "form[action=?][method=?]", playlists_path, "post" do

      assert_select "input[name=?]", "playlist[title]"

      assert_select "input[name=?]", "playlist[user_id]"
    end
  end
end
