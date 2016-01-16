# Get user's poker hand
poker_hand = []

loop do
break if poker_hand.length == 5
print "What the face value of your card? "
value = gets.chomp
print "What the suit of your card? "
suit = gets.chomp
poker_hand << "#{value}#{suit}"
end

def encoder(poker_hand)


  # Set up deck
  deck = {:c  => {}, :d => {}, :h => {}, :s => {}}
  suit_numbers = ["A","2","3","4","5","6","7","8","9","T","J","Q","K"]
  deck_counter = 0
  suit_counter = 0

  deck.each do |suit, suit_hash|
    13.times do
      suit_hash[deck_counter] = suit_numbers[suit_counter]
      deck_counter += 1
      suit_counter += 1
    end
    suit_counter = 0
  end

  encoded_hand = []
  # Encode poker hand
  poker_hand.each do |letters|
    case letters[letters.length-1]
    when "c"
      encoded_hand << deck[:c].key(letters[0])
    when "d"
      encoded_hand << deck[:d].key(letters[0])
    when "h"
      encoded_hand << deck[:h].key(letters[0])
    when "s"
      encoded_hand << deck[:s].key(letters[0])
    end
  end
  print encoded_hand.sort
end


def decoder(poker_hand)

  # Set up deck
  deck = {:c  => {}, :d => {}, :h => {}, :s => {}}
  suit_numbers = ["A","2","3","4","5","6","7","8","9","T","J","Q","K"]
  deck_counter = 0
  suit_counter = 0

  deck.each do |suit, suit_hash|
    13.times do
      suit_hash[deck_counter] = suit_numbers[suit_counter]
      deck_counter += 1
      suit_counter += 1
    end
    suit_counter = 0
  end

  decoded_hand = []
  poker_hand.sort.each do |num|
    if num <= 12
      decoded_hand << (deck[:c].values_at(num) << "c").join
    elsif num <= 25
      decoded_hand << (deck[:d].values_at(num) << "d").join
    elsif num <= 38
      decoded_hand << (deck[:h].values_at(num) << "h").join
    elsif num <= 51
      decoded_hand << (deck[:s].values_at(num) << "s").join
    end
  end
  print decoded_hand
end

encoder(poker_hand)
decoder([4,7,28,40,2])
