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

		trait :not_estimated do
			complexity 0
		end

		trait :easy do
			complexity 1
		end

		trait :medium do
			complexity 3
		end

		trait :hard do
			complexity 5
		end

		trait :not_started do
			status 5
		end

		trait :in_progress do
			status 3
		end

		trait :finished do
			status 0
		end
	end

	factory :user do
		username 'Example User'
		email 'user@moneyvate.me'
		password 'password'
		password_confirmation 'password'
		confirmed_at { Time.now }
	end

	factory :work_log do
		task_id FactoryGirl.create(:task, :not_estimated, :not_started).id
		start_date Date.today
		start_time Time.now
		end_date Date.today
		end_time 8.hours.from_now
	end
end
