require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Card do
  it 'exists' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    expect(round).to be_instance_of(Round)
  end

  it 'has a deck' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    expect(round.deck).to eq(deck)
  end

  it 'has a list of turns' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    expect(round.turns).to eq([])
  end

  it 'can take a card' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    expect(round.current_card).to eq(card_1)
  end

  it 'take a correct turn' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_turn = round.take_turn('Juneau')
    expect(new_turn).to be_instance_of(Turn)
    expect(new_turn.correct?)
    expect(round.number_correct).to eq(1)
  end

  it 'take a correct turnand incorrect turn' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    expect(round.number_correct).to eq(0)
    new_turn = round.take_turn('Juneau')
    expect(round.number_correct).to eq(1)
    new_turn = round.take_turn('Venus')
    expect(round.number_correct).to eq(1)
  end

  it 'advances to the next card after taking a turn' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    expect(round.current_card).to eq(card_1)
    round.take_turn('egg')
    expect(round.current_card).to eq(card_2)
  end

  it 'gives feedback on right and wrong turns' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.take_turn('Juneau')

    expect(round.turns.count).to eq(1)
    expect(round.turns.last.feedback).to eq('Correct Broski!!!')
    expect(round.number_correct).to eq(1)

    round.take_turn('Venus')

    expect(round.turns.count).to eq(2)
    expect(round.turns.last.feedback).to eq('Sorry Broseph, thats wrong!')
    expect(round.number_correct).to eq(1)
  end

  xit 'filters correct answers by category' do
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                      'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.number_correct_by_category(:Geography)).to eq(0)
    expect(round.number_correct_by_category(:STEM)).to eq(0)

    round.take_turn('Juneau')
    round.take_turn('Venus')

    expect(round.number_correct_by_category(:Geography)).to eq(1)
    expect(round.number_correct_by_category(:STEM)).to eq(0)
  end
end
