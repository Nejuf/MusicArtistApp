class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.string :lyrics
      t.string :type, null: false
      t.integer :length, null: false #in seconds

      t.timestamps
    end

    add_index :tracks, :name
  end
end
