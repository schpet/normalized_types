require "spec_helper"

RSpec.describe NormalTypes do
  it "has a version number" do
    expect(NormalTypes::VERSION).not_to be nil
  end

  context "presence: true" do
    subject { NormalTypes::String.new(presence: true) }

    it "returns nil when the string is ''" do
      expect(subject.cast("")).to eq(nil)
    end
  end

  context "presence: false" do
    subject { NormalTypes::String.new(presence: false) }

    it "returns '' when the string is ''" do
      expect(subject.cast("")).to eq("")
    end
  end

  context "strip: true" do
    subject { NormalTypes::String.new(strip: true) }

    it "returns 'cool' when the string is '\n\tcool  '" do
      expect(subject.cast("\n\tcool  ")).to eq("cool")
    end
  end

  context "squish: true" do
    subject { NormalTypes::String.new(squish: true) }

    it 'returns "a b" when the string is "\n\na\n\t\n b\n"' do
      expect(subject.cast("\n\na\n\t\n b\n")).to eq('a b')
    end
  end

  context "truncate: 5" do
    subject { NormalTypes::String.new(truncate: 5) }

    it 'returns "abcde" when the string is "abcdefghij"' do
      expect(subject.cast("abcdefghij")).to eq('abcde')
    end
  end

  context "downcase: true" do
    subject { NormalTypes::String.new(downcase: true) }

    it 'returns "abcde" when the string is "ABcdE"' do
      expect(subject.cast("ABcdE")).to eq('abcde')
    end
  end
end
