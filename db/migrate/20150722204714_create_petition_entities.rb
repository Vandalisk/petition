class CreatePetitionEntities < ActiveRecord::Migration
  def change
    create_table :petition_entities do |t|
      t.string :title
      t.string :description
      t.integer :votes
      t.timestamps null: false
    end
  end
end
