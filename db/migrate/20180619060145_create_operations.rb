class CreateOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :operations do |t|

    	t.string :name
    	t.string :milestone_title 
    	t.string :issue_title
      t.string :email
    	t.integer :work_effort
    	t.date :working_day
		t.integer :estimated_effort_to_complete
		t.date :estimated_project_completion_date
		t.date :planned_start_date
		t.date :planed_end_date
		t.date :actual_start_date
		t.date :actual_end_date
		t.date :replanned_end_date
		t.integer :estimated_effort


      t.timestamps
    end
  end
end
