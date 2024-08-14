# frozen_string_literal: true
class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
end

RSpec.describe Card do
  let(:card) { Card.new("Ace", "Spades") }


  it 'has a rank' do
    expect(card.rank).to eq('Ace')
  end

  it 'has a suite' do
    expect(card.suit).to eq("Spades")
  end

  it 'has a custom error message' do
    comparison = "Spades"
    expect(card.suit).to eq(comparison)
  end
end
