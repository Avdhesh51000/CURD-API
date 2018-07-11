class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|

    	t.string :mname, :null =>  false
    	t.binary :mdata , :null => false
    	t.string :mfilename
      t.string :mime_type

      t.belongs_to :user, index: true

      	
      t.timestamps
    end
  end
end
