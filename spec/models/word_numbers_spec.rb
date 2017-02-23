require 'rails_helper'

describe WordNumbers do
  describe "#word_array" do
    it "returns an array" do
      words = WordNumbers.new.word_array
      expect(words).to be_a(Array)
    end

    context "when range specified" do
      it "uses specified range" do
        words = WordNumbers.new(1, 90).word_array
        expect(words.size).to eq(90)
      end
    end

    context "without a range specified" do
      it "uses 1-1000" do
        words = WordNumbers.new.word_array
        expect(words.size).to eq(1_000)
      end
    end

    it "returns an array of string representations for the range" do
      words = WordNumbers.new(1, 5).word_array
      expect(words).to eq(["one", "two", "three", "four", "five"])
    end

    it "includes 'and' after the hundred keyword" do
      words = WordNumbers.new(100, 101).word_array
      expect(words[1]).to eq("one hundred and one")
    end

    it "includes 'and' after the thousand keyword if no hundred unit" do
      words = WordNumbers.new(1018, 1019).word_array
      words2 = WordNumbers.new(111018, 111019).word_array
      expect(words[1]).to eq("one thousand and nineteen")
      expect(words2[1]).to eq("one hundred and eleven thousand and nineteen")
    end

    it "includes ',' after the thousand keyword if there is a hundred unit" do
      words = WordNumbers.new(1100, 1101).word_array
      words2 = WordNumbers.new(121320, 121321).word_array
      expect(words[1]).to eq("one thousand, one hundred and one")
      expect(words2[1]).to eq("one hundred and twenty one thousand, three hundred and twenty one")
    end

    it "returns an array with the correct words with a 'minus' prefix for negative numbers" do
      words = WordNumbers.new(-4, -3).word_array
      expect(words).to eq(["minus four", "minus three"])
    end

  end
end