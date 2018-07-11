class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :mobile_no
    	t.string :password

      t.timestamps
    end
  end
end
