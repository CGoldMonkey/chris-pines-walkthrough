#Chapter 6 Flow Control
=begin
puts 2 > 1
puts 5 >= 5
puts 'cat' > 'bird'

puts 'Give me your name'
name = gets.chomp
if name == 'Chris'
  puts 'Great fortune for you'
else
  puts 'A curse on you'
end
#Looping: while
command = ''
while command != 'bye'
  command = gets.chomp
  puts command
end
puts 'Come again!'

puts 'What is your name'
name = gets.chomp
puts 'Hello '+name
if (name == 'Chris' or name == 'Katy')
  puts 'What a lovely name'
end
#99 bottles of beer on the wall
bottles = 99
while bottles > 0
  puts bottles.to_s+' bottles of beer on the wall,'
  puts bottles.to_s+' bottles of beer! Take one down, pass it around!'
  puts (bottles-1).to_s+' bottles of beer on the wall!'
  bottles -= 1
end

#Deaf Grandma, Need to SHOUT  to be heard, to exit shout  BYE
puts 'Speak to Grandma'
input = gets.chomp
while input != 'BYE'
  if input == input.upcase
  	puts 'NO, NOT SINCE 19'+(50-rand(21)).to_s+'!'
  else
    puts 'HUH?! SPEAK UP, SONNY!'
  end
  input = gets.chomp
end

#Deaf Grandma Extended need to shout BYE 3 times in a row to leave
puts 'Speak to Grandma'
count = 0
while (count != 3)
  input = gets.chomp
  if input == input.upcase
    puts 'NO, NOT SINCE 19'+(50-rand(21)).to_s+'!'
    if input == 'BYE'
      count += 1
    else
      count = 0
    end
  else
    puts 'HUH?! SPEAK UP, SONNY!'
  end
end
puts 'GOODBYE GRANDSON'

#Leap years, ask for starting and ending year, and puts all leap years including and between them, 
#leap years are divisible by 4 (1984, 2004), but ones divisible by 100 aren't, unless by 400
print 'Enter a starting year:'
startingYear = gets.to_i
print 'Enter the ending year:'
endingYear = gets.to_i
currentYear = startingYear
while currentYear <= endingYear
  if (currentYear%4 == 0 and currentYear%100 != 0)
    puts currentYear
    currentYear +=1
  elsif (currentYear%100 == 0 and currentYear%400 == 0)
    puts currentYear
    currentYear += 1
  else 
    currentYear += 1
  end
end
=end

#Chapter 7: Arrays and Iterators
=begin
array = ['hello', 5]
puts array[1]
puts array[2]
doubleArray = [2, 'hello', [3, 'bye']]
puts doubleArray
#Write a program that asks us to type in as many words as we want until we 
#press enter on an empty line, and then repeats the words back to us in alphabetical order
words = []
puts 'Enter words to be stored and sorted.'
input = gets.chomp
while input != ''
  words.push(input)
  input = gets.chomp
end
puts words.sort.join(', ')

#Try it without the sort method
words = []
puts 'Enter words to be stored and sorted.'
input = gets.chomp
while input != ''
  words.push(input)
  input = gets.chomp
end
current = 0
up = 1
temporary = ''
while (current < words.length)
  while (up < words.length)
    if words[current] <= words[up]
      up += 1
    else
      temporary = words[current]
      words[current] = words[up]
      words[up] = temporary
      up += 1
    end
  end
  current += 1
  up = current + 1
end
puts words.join(', ')

#Rewrite your Table of Contents program (from the chapter on methods).
#Start the program with an array holding all of the information for your
#Table of Contents (chapter names, page numbers, etc.). Then print out the 
#information from the array in a beautifully formatted Table of Contents. 
width = 50
index = 0
contents = ['Chapter 1:  Numbers','page 1','Chapter 2:  Letters','page 72','Chapter 3:  Variables','page 118']
puts 'Table of Contents'.center width
puts
while index < contents.length
  puts contents[index].ljust(width/2)+contents[index+1].rjust(width/2)
  index += 2
end
=end

#Chapter 8: Writing your own methods
=begin
#expanded to put in thousands, then millions
def englishNumber number
  if number < 0  # No negative numbers.
    return 'Please enter a number that isn\'t negative.'
  end
  if number == 0
    return 'zero'
  end

  # No more special cases! No more returns!

  numString = ''  # This is the string we will return.

  onesPlace = ['one',     'two',       'three',    'four',     'five',
               'six',     'seven',     'eight',    'nine']
  tensPlace = ['ten',     'twenty',    'thirty',   'forty',    'fifty',
               'sixty',   'seventy',   'eighty',   'ninety']
  teenagers = ['eleven',  'twelve',    'thirteen', 'fourteen', 'fifteen',
               'sixteen', 'seventeen', 'eighteen', 'nineteen']

  # "left" is how much of the number we still have left to write out.
  # "write" is the part we are writing out right now.
  # write and left... get it?  :)
  left  = number
  write = left/1000000    #millions left to write out
  left = left - write*1000000  #subtract off those millions

  if write > 0
    millions = englishNumber write
    numString = numString + millions + ' million'

    if left > 0
      numString = numString + ' '
    end
  end



  write = left/1000     #how many thousands left to write out
  left = left - write*1000 #subtract off those thousands

  if write > 0
    thousands = englishNumber write
    numString = numString + thousands + ' thousand'

    if left > 0
      numString = numString + ' '
    end
  end

  write = left/100          # How many hundreds left to write out?
  left  = left - write*100  # Subtract off those hundreds.

  if write > 0
    # Now here's a really sly trick:
    hundreds  = englishNumber write
    numString = numString + hundreds + ' hundred'
    # That's called "recursion". So what did I just do?
    # I told this method to call itself, but with "write" instead of
    # "number". Remember that "write" is (at the moment) the number of
    # hundreds we have to write out. After we add "hundreds" to
    # "numString", we add the string ' hundred' after it.
    # So, for example, if we originally called englishNumber with
    # 1999 (so "number" = 1999), then at this point "write" would
    # be 19, and "left" would be 99. The laziest thing to do at this
    # point is to have englishNumber write out the 'nineteen' for us,
    # then we write out ' hundred', and then the rest of
    # englishNumber writes out 'ninety-nine'.

    if left > 0
      # So we don't write 'two hundredfifty-one'...
      numString = numString + ' '
    end
  end

  write = left/10          # How many tens left to write out?
  left  = left - write*10  # Subtract off those tens.

  if write > 0
    if ((write == 1) and (left > 0))
      # Since we can't write "tenty-two" instead of "twelve",
      # we have to make a special exception for these.
      numString = numString + teenagers[left-1]
      # The "-1" is because teenagers[3] is 'fourteen', not 'thirteen'.

      # Since we took care of the digit in the ones place already,
      # we have nothing left to write.
      left = 0
    else
      numString = numString + tensPlace[write-1]
      # The "-1" is because tensPlace[3] is 'forty', not 'thirty'.
    end

    if left > 0
      # So we don't write 'sixtyfour'...
      numString = numString + '-'
    end
  end

  write = left  # How many ones left to write out?
  left  = 0     # Subtract off those ones.

  if write > 0
    numString = numString + onesPlace[write-1]
    # The "-1" is because onesPlace[3] is 'four', not 'three'.
  end

  # Now we just return "numString"...
  numString
end

#weddingNumber is similar to englishNumber but inserts the word 'and'
def weddingNumber number
  if number < 0  # No negative numbers.
    return 'Please enter a number that isn\'t negative.'
  end
  if number == 0
    return 'zero'
  end

  # No more special cases! No more returns!

  numString = ''  # This is the string we will return.

  onesPlace = ['one',     'two',       'three',    'four',     'five',
               'six',     'seven',     'eight',    'nine']
  tensPlace = ['ten',     'twenty',    'thirty',   'forty',    'fifty',
               'sixty',   'seventy',   'eighty',   'ninety']
  teenagers = ['eleven',  'twelve',    'thirteen', 'fourteen', 'fifteen',
               'sixteen', 'seventeen', 'eighteen', 'nineteen']

  # "left" is how much of the number we still have left to write out.
  # "write" is the part we are writing out right now.
  # write and left... get it?  :)
  left  = number
  write = left/100          # How many hundreds left to write out?
  left  = left - write*100  # Subtract off those hundreds.

  if write > 0
    # Now here's a really sly trick:
    hundreds  = weddingNumber write
    numString = numString + hundreds + ' hundred'
    # That's called "recursion". So what did I just do?
    # I told this method to call itself, but with "write" instead of
    # "number". Remember that "write" is (at the moment) the number of
    # hundreds we have to write out. After we add "hundreds" to
    # "numString", we add the string ' hundred' after it.
    # So, for example, if we originally called englishNumber with
    # 1999 (so "number" = 1999), then at this point "write" would
    # be 19, and "left" would be 99. The laziest thing to do at this
    # point is to have englishNumber write out the 'nineteen' for us,
    # then we write out ' hundred', and then the rest of
    # englishNumber writes out 'ninety-nine'.

    if left > 0
      # So we don't write 'two hundredfifty-one'...
      numString = numString + ' and '
    end
  end

  write = left/10          # How many tens left to write out?
  left  = left - write*10  # Subtract off those tens.

  if write > 0
    if ((write == 1) and (left > 0))
      # Since we can't write "tenty-two" instead of "twelve",
      # we have to make a special exception for these.
      numString = numString + teenagers[left-1]
      # The "-1" is because teenagers[3] is 'fourteen', not 'thirteen'.

      # Since we took care of the digit in the ones place already,
      # we have nothing left to write.
      left = 0
    else
      numString = numString + tensPlace[write-1]
      # The "-1" is because tensPlace[3] is 'forty', not 'thirty'.
    end

    if left > 0
      # So we don't write 'sixtyfour'...
      numString = numString + ' and '
    end
  end

  write = left  # How many ones left to write out?
  left  = 0     # Subtract off those ones.

  if write > 0
    numString = numString + onesPlace[write-1]
    # The "-1" is because onesPlace[3] is 'four', not 'three'.
  end

  # Now we just return "numString"...
  numString
end

#Ninety-nine bottles of beer with a mehtod
def bottleOfBeer number

  if number < 0  # No negative numbers.
    return 'Please enter a number that isn\'t negative.'
  end
  if number == 0
    return 'zero'
  end

   numString = ''  # This is the string we will return.

  onesPlace = ['one',     'two',       'three',    'four',     'five',
               'six',     'seven',     'eight',    'nine']
  tensPlace = ['ten',     'twenty',    'thirty',   'forty',    'fifty',
               'sixty',   'seventy',   'eighty',   'ninety']
  teenagers = ['eleven',  'twelve',    'thirteen', 'fourteen', 'fifteen',
               'sixteen', 'seventeen', 'eighteen', 'nineteen']

  # "left" is how much of the number we still have left to write out.
  # "write" is the part we are writing out right now.
  # write and left... get it?  :)
  left = number
  write = left/100          # How many hundreds left to write out?
  left  = left - write*100  # Subtract off those hundreds.

  if write > 0
    # Now here's a really sly trick:
    hundreds  = bottleOfBeer write
    numString = numString + hundreds + ' hundred'
    # That's called "recursion". So what did I just do?
    # I told this method to call itself, but with "write" instead of
    # "number". Remember that "write" is (at the moment) the number of
    # hundreds we have to write out. After we add "hundreds" to
    # "numString", we add the string ' hundred' after it.
    # So, for example, if we originally called englishNumber with
    # 1999 (so "number" = 1999), then at this point "write" would
    # be 19, and "left" would be 99. The laziest thing to do at this
    # point is to have englishNumber write out the 'nineteen' for us,
    # then we write out ' hundred', and then the rest of
    # englishNumber writes out 'ninety-nine'.

    if left > 0
      # So we don't write 'two hundredfifty-one'...
      numString = numString + ' '
    end
  end

  write = left/10          # How many tens left to write out?
  left  = left - write*10  # Subtract off those tens.

  if write > 0
    if ((write == 1) and (left > 0))
      # Since we can't write "tenty-two" instead of "twelve",
      # we have to make a special exception for these.
      numString = numString + teenagers[left-1]
      # The "-1" is because teenagers[3] is 'fourteen', not 'thirteen'.

      # Since we took care of the digit in the ones place already,
      # we have nothing left to write.
      left = 0
    else
      numString = numString + tensPlace[write-1]
      # The "-1" is because tensPlace[3] is 'forty', not 'thirty'.
    end

    if left > 0
      # So we don't write 'sixtyfour'...
      numString = numString + '-'
    end
  end

  write = left  # How many ones left to write out?
  left  = 0     # Subtract off those ones.

  if write > 0
    numString = numString + onesPlace[write-1]
    # The "-1" is because onesPlace[3] is 'four', not 'three'.
  end

  # Now we just return "numString"...
  numString
end

print 'How many bottles of beer are on the wall:'
howManyBottles = gets.to_i
while howManyBottles >= 0
  if howManyBottles > 1
    puts bottleOfBeer(howManyBottles)+' bottles of beer on the wall, '+bottleOfBeer(howManyBottles)+' bottles of beer.
    Take one down and pass it around, '+bottleOfBeer(howManyBottles-1)+' bottles of beer on the wall.'
  elsif howManyBottles == 1
    puts bottleOfBeer(howManyBottles)+' bottle of beer on the wall, '+bottleOfBeer(howManyBottles)+' bottle of beer. 
    Take one down and pass it around, '+bottleOfBeer(howManyBottles-1)+' bottles of beer on the wall.'
  else
    puts 'No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.'
  end
  howManyBottles -= 1
end
=end

#Chapter 9: Classes
=begin
#Make an OrangeTree class. Methods: height, oneYearPasses. Each year the tree 
#grows taller, and after some years the tree dies.  Does not produce fruit the
#first few years, older trees produce more than younger ones. Methods: 
#countTheOranges, pickAnOrange
class OrangeTree
  def initialize
    @height = 5
    @age = 0
    @orangeCount = 0
    @treeAlive = true
  end

  def height
    puts "The height of the tree is "+@height.to_s+" feet."    
  end

  def oneYearPasses
    @orangeCount = 0 #previous years oranges fall off
    @age += 1
    @height += 3
    puts 'The tree is '+@age.to_s+' years old!'
    if @age == 20 #tree dies
      puts 'The tree dies of old age at '+@age.to_s+' years old!'
      @treeAlive = false
      exit
    end
    if @age >= 5 #start producing fruit each year
      @orangeCount += (@age*2)
    end
  end

  def countTheOranges
    puts 'There are '+@orangeCount.to_s+' oranges on the tree!'
  end

  def pickAnOrange
    if @orangeCount == 0
      puts 'There are no more oranges to pick this year'
    else
      @orangeCount -= 1
      puts 'The orange was delicious!'
    end
  end

  def alive?
    @treeAlive
  end
end

tree = OrangeTree.new
while tree.alive?
  tree.height
  tree.countTheOranges
  tree.pickAnOrange
  tree.oneYearPasses
end

#Write a program so you can interact with the baby dragon. You should be
#able to enter commands like feed, walk, and have those methods be called
#on the dragon. Needs to check what string is entered and call the apprpriate
#method
class Dragon
  def initialize name
    @name = name
    @asleep = false
    @stuffInBelly     = 10  # He's full.
    @stuffInIntestine =  0  # He doesn't need to go.

    puts @name + ' is born.'
  end

  def feed
    puts 'You feed ' + @name + '.'
    @stuffInBelly = 10
    passageOfTime
  end

  def walk
    puts 'You walk ' + @name + '.'
    @stuffInIntestine = 0
    passageOfTime
  end

  def putToBed
    puts 'You put ' + @name + ' to bed.'
    @asleep = true
    3.times do
      if @asleep
        passageOfTime
      end
      if @asleep
        puts @name + ' snores, filling the room with smoke.'
      end
    end
    if @asleep
      @asleep = false
      puts @name + ' wakes up slowly.'
    end
  end

  def toss
    puts 'You toss ' + @name + ' up into the air.'
    puts 'He giggles, which singes your eyebrows.'
    passageOfTime
  end

  def rock
    puts 'You rock ' + @name + ' gently.'
    @asleep = true
    puts 'He briefly dozes off...'
    passageOfTime
    if @asleep
      @asleep = false
      puts '...but wakes when you stop.'
    end
  end

  private

  # "private" means that the methods defined here are
  # methods internal to the object.  (You can feed
  # your dragon, but you can't ask him if he's hungry.)

  def hungry?
    # Method names can end with "?".
    # Usually, we only do this if the method
    # returns true or false, like this:
    @stuffInBelly <= 2
  end

  def poopy?
    @stuffInIntestine >= 8
  end

  def passageOfTime
    if @stuffInBelly > 0
      # Move food from belly to intestine.
      @stuffInBelly     = @stuffInBelly     - 1
      @stuffInIntestine = @stuffInIntestine + 1
    else  # Our dragon is starving!
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts @name + ' is starving!  In desperation, he ate YOU!'
      exit  # This quits the program.
    end

    if @stuffInIntestine >= 10
      @stuffInIntestine = 0
      puts 'Whoops!  ' + @name + ' had an accident...'
    end

    if hungry?
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts @name + '\'s stomach grumbles...'
    end

    if poopy?
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts @name + ' does the potty dance...'
    end
  end
end

#needs to be able to recognize feed, walk, putToBed, toss, rock
pet = Dragon.new('Norbert')
input = ''
puts 'Acceptable commands are exit, feed, walk, putToBed, toss, and rock'
while input != 'exit'
  input = gets.chomp
  if input == 'feed'
    pet.feed
  elsif input == 'walk'
    pet.walk
  elsif input == 'putToBed'
    pet.putToBed
  elsif input == 'toss'
    pet.toss
  elsif input == 'rock'
    pet.rock
  else
    puts 'Command cannot be recognized, try again.'
  end
end
=end

#Chapter 10: Blocks and Procs
=begin
#Grandfather Clock. Write a method that takes a block and calls it once for
#each hour that passed today. So if we were to pass in the block do puts 'DONG'
#end, it whould chime like a grandfather clock.  Test the method with a few 
#different blocks.  Can use Time.now.hour to get the current hour (0 to 23).
def grandfatherClock proc
  time = Time.now.hour
    if time == 0 #midnight, call the block 12 times
    numberOfCalls = 12
  elsif (time > 0 && time < 13) ## between 1AM and 12PM (noon)
    numberOfCalls = time

  else #between 13 to 23 (or 1 to 11PM)
    numberOfCalls = time - 12
  end
  numberOfCalls.times do 
    proc.call
  end
end

dong = Proc.new do
  puts 'DONG!'
end
math = Proc.new {puts 5**2}

grandfatherClock dong
grandfatherClock math

#Program Logger. Write a method called log which takes a string description of
#a block and a block. It should puts a string telling that it has started the 
#block, and another string at the end telling you that the block has finished,
#and also telling you what the block has retruned. Test method by senting it a 
#code block, inside the blockput another call to log, passing another block to
#it.
def log(description, proc)
  puts 'Beginning '+description+'...'
  value = proc.call
  puts 'Ending '+description+', returning: '
  puts value
end

number = Proc.new {88}
procNumber = 'number'

procBoolean = Proc.new {true}
boolean = 'true'

hello = Proc.new do
  log(boolean, procBoolean)
  'Hello'
end
procString = 'string'

log(procString, hello)
log(procNumber, number)
=end
#Better Logger. Last logger outut was hard to read. Indent the lines in the
#inner bloccks. You need to track how deeply nested you are every time 
#the logger wants to write something. Use a global varaible, $variableName.
$space = ' '
$depth = 0
def betterLog(description, proc)
  puts ($space*$depth)+'Beginning '+description+'...'
  $depth += 1
  value = proc.call
  $depth -= 1
  puts ($space*$depth)+'Ending '+description+', returning: '
  puts ($space*$depth).to_s+value.to_s
end

number = Proc.new {88}
procNumber = 'number'

procBoolean = Proc.new {true}
boolean = 'true'

hello = Proc.new do
  betterLog(boolean, procBoolean)
  'Hello'
end
procString = 'string'

betterLog(procString, hello)
betterLog(procNumber, number)

#Chapter 11: Beyond This Tutorial