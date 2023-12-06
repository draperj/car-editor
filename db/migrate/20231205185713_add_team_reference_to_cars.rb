class AddTeamReferenceToCars < ActiveRecord::Migration[7.1]
  def change
    add_reference :cars, :team, null: false, foreign_key: true
  end
end
