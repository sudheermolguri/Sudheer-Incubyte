class Calculator
  
  def add(value)
    array = value.split(",")
    value.empty?? 0 : value.split(/[\n,]/).map{|i| i.to_i}.reduce(:+)

    delimiter = /[,\n]/
    if value.start_with?("//")
      delimiter_line, numbers_line = value.split("\n", 2)
      delimiter = Regexp.new(Regexp.escape(delimiter_line[2..-1]))
      value = numbers_line
    end
    numbers = value.split(delimiter).map(&:to_i)
    negatives = numbers.select { |n| n < 0 }
    if negatives.any?
      raise "negative numbers not allowed #{negatives.join(',')}"
    end
    numbers.sum      
  end
end