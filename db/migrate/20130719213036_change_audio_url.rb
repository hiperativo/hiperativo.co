class ChangeAudioUrl < ActiveRecord::Migration
  def change
  	rename_column :impulsos, :audio_url, :audio
  end
end
