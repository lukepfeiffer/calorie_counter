require 'spec_helper'

RSpec.describe "Formatter", type: :model do
  let(:time) { Time.now }
  let(:date) { Date.today }

  it "formats date to month day, year" do
    formatted_date = Formatter.date(date)
    expect(formatted_date).to eq(date.strftime("%B %e, %Y"))
  end

  it "formats time to hour:minute meridian" do
    formatted_time = Formatter.time(time)
    expect(formatted_time).to eq(time.strftime("%l:%M %P"))
  end
end
