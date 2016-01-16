def encoder(poker_hand)
  deck = Hash.new
  suite_numbers = ["A",2,3,4,5,6,7,8,9,"T","J","Q","K"]
  for n in 0..51
    case
    when n <= 12
      deck[n] = "#{suite_numbers[n]}c"
    when n <= 25
      deck[n] = "#{suite_numbers[n-13]}d"
    when n <= 38
      deck[n] = "#{suite_numbers[n-26]}h"
    when n <= 51
      deck[n] = "#{suite_numbers[n-39]}s"
    end
  end
  poker_hand_encoded = poker_hand.map {|elm| deck.key(elm)}.sort
end

print encoder(['Ac', 'Ks', '5h', 'Td', '3c'])

def decoder(poker_hand)
  deck = Hash.new
  suite_numbers = ["A",2,3,4,5,6,7,8,9,"T","J","Q","K"]
  for n in 0..51
    case
    when n <= 12
      deck[n] = "#{suite_numbers[n]}c"
    when n <= 25
      deck[n] = "#{suite_numbers[n-13]}d"
    when n <= 38
      deck[n] = "#{suite_numbers[n-26]}h"
    when n <= 51
      deck[n] = "#{suite_numbers[n-39]}s"
    end
  end
  poker_hand_decoded = poker_hand.sort.map {|elm| deck.values_at(elm)}
end

print decoder([0, 51, 30, 22, 2])
