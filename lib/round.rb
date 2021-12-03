class Round
  attr_reader :deck, :turns, :cards, :card

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    turns << turn
    deck.rotate
    turn
  end

  def number_correct
    turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(category_name)
    turns.count do |turn|
      turn.correct? && (turn.card.category == category_name)
    end
  end
end
