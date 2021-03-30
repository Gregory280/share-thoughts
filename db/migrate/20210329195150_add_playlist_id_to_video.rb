class AddPlaylistIdToVideo < ActiveRecord::Migration[6.1]
  def change
    add_reference :videos, :playlist, null: true, foreign_key: true
  end
end
