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
	end

	factory :user do
		username 'Example User'
		email 'user@moneyvate.me'
		password 'password'
		password_confirmation 'password'
		confirmed_at { Time.now }
	end
end
