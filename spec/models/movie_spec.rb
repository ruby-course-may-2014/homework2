require 'spec_helper'

describe Movie do
  context ".all_ratings" do
    it 'No movies - no ratings' do
      expect(Movie.all_ratings).to eq([])
    end

    it 'One movie - one rating' do
      Movie.create(title: 'aaa', rating: 'R', release_date: Date.today)
      expect(Movie.all_ratings).to eq(['R'])
    end

    it 'Another movie - another rating' do
      Movie.create(title: 'aaa', rating: 'PG', release_date: Date.today)
      expect(Movie.all_ratings).to eq(['PG'])
    end

    it 'Two movies - two ratings' do
      Movie.create(title: 'aaa', rating: 'PG', release_date: Date.today)
      Movie.create(title: 'aaa', rating: 'R', release_date: Date.today)
      expect(Movie.all_ratings).to eq(['PG', 'R'])
    end

    it 'No duplicates' do
      Movie.create(title: 'aaa', rating: 'PG', release_date: Date.today)
      Movie.create(title: 'aaa', rating: 'PG', release_date: Date.today)
      expect(Movie.all_ratings).to eq(['PG'])
    end

  end
end
