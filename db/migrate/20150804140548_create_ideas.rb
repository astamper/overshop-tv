class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :desc

      t.timestamps null: false
    end
  end
end
