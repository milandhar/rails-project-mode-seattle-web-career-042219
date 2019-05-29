class Hand < ApplicationRecord
  belongs_to :round
  has_many :cards


#https://codereview.stackexchange.com/questions/37165/weekend-challenge-ruby-poker-hand-evaluation
  ACE_LOW  = 1
  ACE_HIGH = 14


  RANKS = {
      straight_flush:  8,
      four_of_a_kind:  7,
      full_house:      6,
      flush:           5,
      straight:        4,
      three_of_a_kind: 3,
      two_pair:        2,
      pair:            1
    }.freeze

  def initialize(attributes_hash = {})
    byebug
    raise ArgumentError unless self.cards.count == 5
    self.cards = self.cards.freeze
  end

  # def user_deal
  #   5.times do
  #   user_card_1 = Card.deal
  #   self.cards << user_card_1
  #   if
  #   self.cards << Card.random
  #   self.cards << Card.random
  #   self.cards << Card.random
  #   self.cards << Card.random
  #   self.cards
  # end
  #
  # def dealer_deal
  #
  # end


  # The hand's rank as an array containing the hand's
  # type and that type's base score
  def rank
    RANKS.detect { |method, rank| send :"#{method}?" } || [:high_card, 0]
  end

  # The hand's type (e.g. :flush or :pair)
  def type
    rank.first
  end

  # The hand's base score (based on rank)
  def base_score
    rank.last
  end

  # The hand's score is an array starting with the
  # base score, followed by the kickers.
  def score
    [base_score] + kickers
  end

  # Tie-breaking kickers, ordered high to low.
 def kickers
   repeat_values + (aces_low? ? aces_low_values.reverse : single_values)
 end

 # If the hand's straight and flush, it's a straight flush
   def straight_flush?
     straight? && flush?
   end

   # Is a value repeated 4 times?
  def four_of_a_kind?
    repeat_counts.include? 4
  end

  # Three of a kind and a pair make a full house
 def full_house?
   three_of_a_kind? && pair?
 end

 # If the hand only contains one suit, it's flush
  def flush?
    suits.uniq.count == 1
  end

  # This is the only hand where high vs low aces comes into play.
    def straight?
      aces_high_straight? || aces_low_straight?
    end

    # Is a card value repeated 3 times?
    def three_of_a_kind?
      repeat_counts.include? 3
    end

    # Are there 2 instances of repeated card values?
    def two_pair?
      repeat_counts.count(2) == 2
    end

    # Any repeating card value?
    def pair?
      repeat_counts.include? 2
    end

    # Actually just an alias for aces_low_straight?
    def aces_low?
      aces_low_straight?
    end

    # Does the hand include one or more aces?
    def aces?
      values.include? ACE_HIGH
    end

    # The repeats in the hand
    def repeats
      cards.group_by &:value
    end

    # The number of repeats in the hand, unordered
    def repeat_counts
      repeats.values.map &:count
    end

    # The values that are repeated more than once, sorted by
    # number of occurrences
    def repeat_values
      repeated = repeats.map { |value, repeats| [value.to_i, repeats.count] }
      repeated = repeated.reject { |value, count| count == 1 }
      repeated = repeated.sort_by { |value, count| [count, value] }.reverse
      repeated.map(&:first)
    end

    # Values that are not repeated, sorted high to low
    def single_values
      repeats.select { |value, repeats| repeats.count == 1 }.map(&:first).sort.reverse
    end

    # Ordered (low to high) array of card values (assumes aces high)
    def values
      cards.map(&:value).sort
    end

    # Unordered array of card suits
    def suits
      cards.map(&:suit)
    end

    # A "standard" straight, treating aces as high
    def aces_high_straight?
      straight_values_from(values.first) == values
    end

    # Special case straight, treating aces as low
    def aces_low_straight?
      aces? && straight_values_from(aces_low_values.first) == aces_low_values
    end

    # The card values as an array, treating aces as low
    def aces_low_values
      cards.map(&:value).map { |v| v == ACE_HIGH ? ACE_LOW : v }.sort
    end

    private

    # Generate an array of 5 consecutive values
    # starting with the `from` value
    def straight_values_from(from)
      (from...from + 5).to_a
    end


  end
