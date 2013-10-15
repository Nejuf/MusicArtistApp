class RenameLengthInTracks < ActiveRecord::Migration
  def change
  	rename_column :tracks, :length, :track_length
  end
end
