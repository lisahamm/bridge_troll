require 'rails_helper'

describe Chapter do
  it { is_expected.to validate_presence_of(:name) }

  it 'validates the format of twitter_handle' do
    def chapter(twitter_handle)
      Chapter.new(twitter_handle: twitter_handle)
    end

    expect(chapter('hello world')).to have(1).errors_on(:twitter_handle)
    expect(chapter('helloworld')).to have(0).errors_on(:twitter_handle)
    expect(chapter('@helloworld')).to have(0).errors_on(:twitter_handle)
  end

  it 'removes leading @ signs from twitter handle' do
    chapter = Chapter.new(twitter_handle: '@apple')
    expect(chapter.twitter_handle).to eq('apple')
  end

  describe "#has_leader?" do
    let(:chapter) { create :chapter }
    let(:user) { create :user }

    context "with a user that is a leader" do
      before { ChapterLeadership.create(user: user, chapter: chapter) }

      it "is true" do
        expect(chapter).to have_leader(user)
      end
    end

    context "with a user that is not a leader" do
      it "is false" do
        expect(chapter).not_to have_leader(user)
      end
    end
  end
end
