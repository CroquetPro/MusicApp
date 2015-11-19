class CreateBands < ActiveRecord::Migration
  def change

    create_table :bands do |t|
      t.string :name, null: false
      t.timestamps null: false
    end
    add_index :bands, :name

    create_table :albums do |t|
      t.string :name, null: false
      t.integer :band_id, null: false
      t.string  :atype, null: false
      t.timestamps null: false
    end
    add_index :albums, :band_id

    create_table :tracks do |t|
      t.string :title, null: false
      t.integer :album_id, null: false
      t.string  :ttype, null: false
      t.text :lyrics
      t.timestamps null: false
    end
    add_index :tracks, :album_id

  end
end
