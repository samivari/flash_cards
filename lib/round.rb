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

  def percent_correct
    return number_correct.to_f / turns.count * 100 unless turns.empty?
    return 0 if turns.empty?
  end
end
