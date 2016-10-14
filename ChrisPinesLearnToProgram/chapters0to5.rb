=begin
# Chapter 1 Numbers
puts 1+2
puts 1.0+2.0
puts 2.0*3.0
puts 5.0-8.0
puts 9.0/2.0

puts 1+2
puts 2*3
puts 5-8
puts 9/2
puts 5*(12-8)+-15
puts 98+(59872/(13*8))*-52

puts "Hours in a year: #{365*24}!"
puts "Minutes in a decade: #{10*365*24*60}"
puts "How many seconds old I am if 24 years old: #{24*365*24*60*60}"
puts "How many chocolates I hope to eat if I eat 100/year till 83: #{83*100}"
puts "If I am 1246 million seconds old, how old am I? #{1_246_000_000/(60*60*24*365)} years"
=end

#Chapter 2 Letters
=begin
puts 'Hello, world!'
puts ''
puts 'Good-bye.'

puts 'I like' + 'apple pie.'
puts 'I like ' + 'apple pie.'
puts 'I like' + ' apple pie.'

puts 'blink '*4

puts 12+12
puts '12'+'12'
puts '12 + 12'

puts 2*5
puts '2'*5
puts '2 * 5'

puts 'You\'re swell!'
puts 'backslash at the wrong end of a string: \\'
puts 'up\\down'
puts 'up\down'
=end

#Chapter 3 Variables and Assignment
=begin
myString = '...you can say that again...'
puts myString
puts myString

name = 'Patricia Rosanna Jessica Mildred Oppenheimer'
puts 'My name is '+name+'!'
puts 'Wow! '+name+ ' is a really long name!'

var = 'just another ' + 'string'
puts var

var = 5*(1+2)
puts var

var1 = 8
var2 = var1
puts var1
puts var2

puts ''

var1 = 'eight'
puts var1
puts var2
=end

#Chapter 4 Mixing It up
=begin
var1 = 2
var2 = '5'

puts var1.to_s + var2
puts var1 + var2.to_i

puts '15'.to_f
puts '99.999'.to_f
puts '99.999'.to_i
puts ''
puts '5 is my favorite number!'.to_i
puts 'Who asked you about 5 or whatever?'.to_i
puts 'Your momma did.'.to_f
puts ''
puts 'stringy'.to_s
puts '3'.to_i

puts 20
puts 20.to_s
puts '20'

puts gets
puts 'Hello there, and what\'s your name?'
name = gets.chomp
puts 'Your name is '+name+'? What a lovely name!'
puts 'Pleased to meet you, '+name+'. :)'

puts 'What is you first name?'
first = gets.chomp
puts 'What is you middle name?'
middle = gets.chomp
puts 'What is you last name?'
last = gets.chomp
puts 'Greetings '+first+' '+middle+' '+last+'!'

puts 'What is you favorite number'
favorite = gets.chomp
better = favorite.to_f + 1
puts 'A bigger and better favorite number is '+better.to_s+'!'
=end

#Chapter 5 More About Methods
var1 = 'stop'
var2 = 'stressed'
var3 = 'Can you pronounce this sentence backwards?'

puts var1.reverse
puts var2.reverse
puts var3.reverse
puts var1
puts var2
puts var3

puts 'What is you full name?'
name = gets.chomp
puts 'There are '+name.length.to_s+' characters in you name, '+name+'.'

puts 'What is you first name?'
first = gets.chomp
puts 'What is you middle name?'
middle = gets.chomp
puts 'What is you last name?'
last = gets.chomp
sum = first.length + middle.length + last.length
puts 'There are '+sum.to_s+' characters in you name '+first+' '+middle+' '+last+'!'
#upcase, downcase, swapcase, capitalize
letters = 'aAbBcCdDeE'
puts letters.upcase
puts letters.downcase
puts letters.swapcase
puts letters.capitalize
puts ' a'.capitalize
puts letters
#.center
lineWidth = 50
puts('Old Mother Hubbard'.center(lineWidth))
puts('Sat in her cupboard'.center(lineWidth))
puts('Eating her curds an whey,'.center(lineWidth))
puts('When along came a spider'.center(lineWidth))
puts('Which sat down beside her'.center(lineWidth))
puts('And scared her poor shoe dog away.'.center(lineWidth))
#ljust, and rjust
lineWidth = 40
str = '--> text <--'
puts str.ljust lineWidth
puts str.center lineWidth
puts str.rjust lineWidth
puts str.ljust(lineWidth/2) + str.rjust(lineWidth/2)

#Angry boss program, rudely ask, answer and fired
puts 'WHAT DO YOU WANT? I\'M BUSY'
reply = gets.chomp
puts 'WHAT DO YOU MEAN "'+reply.upcase+'"?!? YOU\'RE FIRED!!!'
#Table of contents
width = 50
puts 'Table of Contents'.center width
puts
puts 'Chapter 1:  Numbers'.ljust(width/2)+'page 1'.rjust(width/2)
puts 'Chapter 2:  Letters'.ljust(width/2)+'page 72'.rjust(width/2)
puts 'Chapter 3:  Variables'.ljust(width/2)+'page 118'.rjust(width/2)
#More arithmetic **(exponential) and %(modulus), and .abs (absolute val)
puts 5**2
puts 5**0.5
puts 7/3
puts 7%3
puts 365%7
puts((5-2).abs)
puts((2-5).abs)
#Random numbers rand => 0<= float <1.0, rand(5) => 0 <= integer < 5
puts rand
puts rand
puts rand
puts(rand(100))
puts(rand(100))
puts(rand(100))
puts(rand(1))
puts(rand(1))
puts(rand(1))
puts(rand(9999999999999999999999999999999999999999))
puts('The News said there is a '+rand(101).to_s+'% chance of rain,')
puts('but you can never trust the weatherman')
#Set the seed to get the same random numbers in the same sequence
srand 111
puts rand(100)
puts rand(100)
puts rand(50)
srand 111
puts rand(100)
puts rand(100)
puts rand(50)
#The Math Object
puts Math::PI
puts Math::E
puts(Math.cos(Math::PI/3))
puts Math.tan(Math::PI/4)
puts(Math.log(Math::E**2))
puts (1 + Math.sqrt(5))/2