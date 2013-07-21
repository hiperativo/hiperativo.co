class AddNeurotransmissaoToImpulsos < ActiveRecord::Migration
  def change
    add_column :impulsos, :neurotransmissao, :boolean
  end
end
