require 'spec_helper'

describe ProblemsController do
  describe "#approve" do
    it "should tweet the url for the rubeque problem" do
      Problem.delete_all
      Problem.create!(
        difficulty: 0,
        title: "The Truth",
        tag_list: "booleans",
        instructions: "Here's a hint: true equals true.",
        code: "assert_equal true, ___",
        approved: true,
        order_number: (order_number=1))
      ENV['TWITTER_CONSUMER_KEY'].should be_nil
      path = problem_path("the-truth")
      Twitter.should_receive(:update).with("Rubeque has a new problem to solve: http://test.host#{path}")
      post :approve, {:id=>"the-truth"}
    end
  end
end
