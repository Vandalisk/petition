class AddUserToPetitionEntity < ActiveRecord::Migration
  def change
    add_reference :petition_entities, :user, index: true
  end
end
