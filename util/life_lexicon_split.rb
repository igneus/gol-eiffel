# Reads the txt file of the Life Lexicon
# (download the zip file here https://conwaylife.com/ref/lexicon/lex_home.htm )
# outputs the examples one per file in the current working directory.

example = []
fname = 'xxx'

ARGF.each_line do |l|
  if l =~ /^:(.+?):/
    unless example.empty?
      File.write fname, example.join("\n")
    end

    example = []
    fname = Regexp.last_match[1].gsub(/[\s\/]/, '_') + '.cells'
  end

  ls = l.strip
  next if ls.empty?

  if ls =~ /^[\.\*]+$/
    example << ls.gsub('*', 'O')
  else
    example << ('! ' + ls)
  end
end
