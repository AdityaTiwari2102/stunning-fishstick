# frozen_string_literal: true

require 'factory_bot_rails'

p 'Creating users...'
FactoryBot.create_list(:user, 50)

p 'Creating groups and memberships...'
FactoryBot.create_list(:group, 5)
FactoryBot.create_list(:group, 10, :with_membership)

p 'Creating posts and comments...'
FactoryBot.create_list(:post, 15)
FactoryBot.create_list(:post, 15, :with_comments)
