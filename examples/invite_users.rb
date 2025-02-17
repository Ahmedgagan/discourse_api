# frozen_string_literal: true
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require File.expand_path('../../lib/discourse_api', __FILE__)

config = DiscourseApi::ExampleHelper.load_yml

client = DiscourseApi::Client.new(config['host'] || 'http://localhost:3000')
client.api_key = config['api_key'] || "YOUR_API_KEY"
client.api_username = config['api_username'] || "YOUR_USERNAME"

# invite user
invite = client.invite_user(email: "name@example.com", group_ids: "41,42")

#update invite
client.update_invite(invite["id"], email: "namee@example.com")

# invite to a topic
client.invite_user_to_topic(email: "foo@bar.com", topic_id: 1)

# if the user is an admin you may invite to a group as well
client.invite_user_to_topic(email: "foo@bar.com", group_ids: "1,2,3", topic_id: 1)

# retrieve invite
puts client.retrieve_invite(email: "foo@bar.com")
