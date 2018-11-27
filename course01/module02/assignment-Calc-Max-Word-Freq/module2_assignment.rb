class LineAnalyzer
  attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number

  def initialize(content, line_number)
    @content = content
    @line_number = line_number
    calculate_word_frequency
  end

  def calculate_word_frequency
    unique_words = content.split.uniq
    @highest_wf_count = 0
    unique_words.each do |curr_word|
      curr_count = content.split.count(curr_word)
      if curr_count > @highest_wf_count
        @highest_wf_count = curr_count
        @highest_wf_words = [curr_word]
      elsif curr_count == @highest_wf_count
        @highest_wf_words << curr_word
      end
    end
  end
end

class Solution

  attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines

  def initialize
    @analyzers = []
  end

  def analyze_file
    File.open("test.txt") do |f|
      f.each_with_index do |line, i|
        @analyzers << LineAnalyzer.new(line.downcase.chomp, i)
      end
    end
  end

  def calculate_line_with_highest_frequency
    a = analyzers.group_by { |a| a.highest_wf_count }.max.last
    @highest_count_across_lines = a.first.highest_wf_count
    @highest_count_words_across_lines = a
  end

  def print_highest_word_frequency_across_lines
    puts highest_count_words_across_lines 
  end
end
