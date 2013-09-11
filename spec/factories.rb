FactoryGirl.define do
	factory :client_type do
		name 'Example Client Type'
	end

	factory :client do
		name 'Example Client'
		client_type_id FactoryGirl.create(:client_type).id
	end

	factory :contact_type do
		name 'Example Contact Type'
	end

	factory :contact do
		name 'Example Contact'
		contact_type_id FactoryGirl.create(:contact_type).id
		client_id FactoryGirl.create(:client).id
	end

	factory :task do
		name 'Example Task'
		complexity 0
	end

	factory :easy, class: Task do
		name 'Easy Task'
		complexity 1
	end

	factory :medium, class: Task do
		name 'Medium Task'
		complexity 3
	end

	factory :hard, class: Task do
		name 'Hard Task'
		complexity 5
	end

	factory :user do
		username 'Example User'
		email 'user@moneyvate.me'
		password 'password'
		password_confirmation 'password'
		confirmed_at { Time.now }
	end

	factory :work_log do
		task_id FactoryGirl.create(:task).id
	end
end
