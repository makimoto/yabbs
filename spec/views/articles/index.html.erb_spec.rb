require 'spec_helper'

describe "articles/index" do
  before(:each) do
    assign(:articles, [
      stub_model(Article,
        :title => "Title",
        :name => "Name",
        :body => "MyText",
        :created_at => Time.now,
      ),
      stub_model(Article,
        :title => "Title",
        :name => "Name",
        :body => "MyText",
        :created_at => Time.now,
      )
    ])
  end

  it "renders a list of articles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select ".article>h2", :text => "Title".to_s, :count => 2
    assert_select ".article>.article_meta", :text => /Name/, :count => 2
    assert_select ".article>.article_body", :text => "MyText", :count => 2
  end
end
