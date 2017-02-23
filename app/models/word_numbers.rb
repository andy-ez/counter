class WordNumbers
  
  def initialize(range_start=1, range_end=1_000)
    @range = (range_start..range_end)
  end

  def word_array
    @range.map{ |number| number < 0 ? "minus " + to_words(number).downcase : to_words(number).downcase }
  end

private

  def to_words(int)
    abs = int.abs
    return "Out of range" if abs > 1_000_000
    case
    when int == 0
      return ""
    when abs <= 20
      return base_numbers[abs]
    when abs < 100
      return "#{base_numbers[(abs / 10) * 10]} #{to_words(abs % 10)}"
    when abs < 1_000
      return "#{to_words(abs / 100)} #{base_numbers[100]}" if abs % 100 == 0
      return "#{to_words(abs / 100)} #{base_numbers[100]} and #{to_words(abs % 100)}"
    when abs < 1_000_000
      return "#{to_words(abs / 1_000)} #{base_numbers[1_000]}" if abs % 1_000 == 0
      return "#{to_words(abs / 1_000)} #{base_numbers[1_000]}#{abs % 1_000 < 100 ? ' and' : ',' } #{to_words(abs % 1_000)}"
    else
      return "one #{base_numbers[abs]}"
    end
  end
  
  def base_numbers
    { 
      1=> "One", 
      2=> "Two", 
      3=> "Three",
      4=> "Four", 
      5=> "Five",
      6=> "six", 
      7=> "seven", 
      8=> "Eight",
      9=> "Nine",
      10=> "Ten",
      11=> "Eleven",
      12=> "Twelve",
      13=> "Thirteen",
      14=> "Fourteen",
      15=> "Fifteen",
      16=> "Sixteen",
      17=> "Seventeen",
      18=> "Eighteen",
      19=> "Nineteen",
      20=> "Twenty",
      30=> "Thirty",
      40=> "Fourty",
      50=> "Fifty",
      60=> "Sixty",
      70=> "Seventy",
      80=> "Eighty",
      90=> "Ninty",
      100=> "Hundred",
      1_000=> "Thousand",
      1_000_000=> "Million"
    }
  end
end



