class CreateTeams < ActiveRecord::Migration
  def change #this migration creates a method named "change"; "change" is called when this migration is ran
	#upon running this migration, it creates a "teams" table with one string column (name), an integer column (division), an id column (included by default so no need to define it here), and a timestamp column
	#note: with the timstamp column, "created_at" and "updated_at" are columns of the db table that are automatically added by default (populated by Active Record automatically); and the "null: false" portion just means that you cannot give NULL values for "created_at" and "updated_at"
    create_table :teams do |t|
      t.string :name
      t.integer :division

      t.timestamps null: false
    end
  end
end
