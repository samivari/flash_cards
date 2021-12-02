require './lib/turn'
require './lib/card'

RSpec.describe Card do
  it 'exists' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)
    expect(turn).to be_instance_of(Turn)
    expect(card).to be_instance_of(Card)
  end

  it 'has a card' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)
    expect(turn.card).to eq(card)
  end

  it 'has a guess' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)
    expect(turn.guess).to eq('Juneau')
  end

  it 'has knows if the answer is correct' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)
    expect(turn.correct?).to be true
  end

  it 'gives feedback' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)
    expect(turn.feedback).to eq('Correct Broski!!!')
  end

  it 'is a new card' do
    card = Card.new('Which planet is closest to the sun?', 'Mercury', :STEM)
    turn = Turn.new('Saturn', card)
    expect(turn).to be_instance_of(Turn)
    expect(card).to be_instance_of(Card)
  end

  it 'has a card' do
    card = Card.new('Which planet is closest to the sun?', 'Mercury', :STEM)
    turn = Turn.new('Saturn', card)
    expect(turn.card).to eq(card)
  end

  it 'has a guess' do
    card = Card.new('Which planet is closest to the sun?', 'Mercury', :STEM)
    turn = Turn.new('Saturn', card)
    expect(turn.guess).to eq('Saturn')
  end

  it 'has knows if the answer is correct' do
    card = Card.new('Which planet is closest to the sun?', 'Mercury', :STEM)
    turn = Turn.new('Saturn', card)
    expect(turn.correct?).to be false
  end

  it 'gives feedback' do
    card = Card.new('Which planet is closest to the sun?', 'Mercury', :STEM)
    turn = Turn.new('Saturn', card)
    expect(turn.feedback).to eq('Sorry Broseph, thats wrong!')
  end
end
