class CreateInnings < ActiveRecord::Migration[5.2]
  def change
    create_table :innings do |t|
      t.string :title

      t.timestamps
    end
  end
end
