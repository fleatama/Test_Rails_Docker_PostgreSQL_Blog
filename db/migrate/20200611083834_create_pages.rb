class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.text :title
      t.text :contents

      t.timestamps
    end
  end
end
