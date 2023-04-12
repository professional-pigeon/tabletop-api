class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.string :content, null: false
      t.references :note_place, polymorphic: true

      t.timestamps
    end
  end
end
