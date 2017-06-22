require 'rails_helper'

describe Topic do
	# タイトルと内容があれば有効な状態
	it "is valid with title" do
	  topic = Topic.new(title: 'test', content: 'test')
	  expect(topic).to be_valid
	end

	# タイトルがなければ無効な状態
	it "is invalid with title" do
	  topic = Topic.new
	  expect(topic).not_to be_valid
	end

	it "is valid with title" do
		topic = Topic.new
		topic.valid?
		expect(topic.errors[:title]).to include("を入力してください")
	end
end