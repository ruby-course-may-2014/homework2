require 'spec_helper'

describe ApplicationHelper do
  context '#shorten' do
    it 'return empty string for empty string' do
      expect(helper.shorten("", 10)).to eq("")
    end

    it 'does not shorten short string' do
      expect(helper.shorten("Short text", 10)).to eq("Short text")
    end

    it 'shortens long string' do
      src = (["Hello"] * 50).to_sentence
      res = "Hello, ..."
      expect(helper.shorten(src, 10)).to eq(res)
    end

    it 'allows pass ending' do
      src = (["Hello"] * 50).to_sentence
      res = "Hell<more>"
      expect(helper.shorten(src, 10, "<more>")).to eq(res)
    end


  end
end
