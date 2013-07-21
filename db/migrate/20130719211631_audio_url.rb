class AudioUrl < ActiveRecord::Migration
  def change
  	add_column :impulsos, :audio_url, :string
  end
end
