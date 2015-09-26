## Text Analyzer ##
lines = File.readlines(ARGV[0])
text = lines.join

#count lines, chars, words, sentences
line_count = lines.size
total_characters = text.length
total_characters_no_spaces = text.gsub(/\s+/, "").length
word_count = text.split.length
sentence_count = text.split(/\.|\?|!/).length
paragraph_count = text.split(/\n\n/).length

#interest index
stopwords = %w{the a by on for of are with just but and to my has some in}
words = text.scan(/\w+/)
keywords = words.select {|word| !stopwords.include?(word)}
interest_index = ((keywords.length.to_f / words.length.to_f) * 100).to_i

#summary generator
sentences = text.gsub(/\s+/, " ").strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by {|sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select {|sentence| sentence =~ /is|are/}
summary = ideal_sentences.join(". ")
#output
puts "\n--START OF ANALYSIS\n"
puts "#{line_count} lines"
puts "#{total_characters} characters"
puts "#{total_characters_no_spaces} characters excluding whitespace"
puts "#{word_count} words"
puts "#{sentence_count} sentences"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count/paragraph_count} sentences per paragraph (average)"
puts "#{word_count/sentence_count} words per sentence (average)"
puts "#{interest_index}% of words are interesting"
puts "Summary:\n\n #{summary}"
puts "\n-- END OF ANALYSIS"