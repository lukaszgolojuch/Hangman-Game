# Name: Hangman Game
# Language: Ruby
# Environment: Visual Studio
#
# Author: Lukasz Golojuch

require 'io/console'

class User
    #class with players
    #name - name of player
    #points - actual points
    #word - word that other player gave us
    attr_accessor :name, :points, :word
end

def hangman_print(wrong_moves)
    #function drawing gallow
    puts "\n \n"
    case wrong_moves
        when 1
            #1 wrong answer
            puts "_"
        when 2
            #2 wrong answers
            puts "__"
        when 3
            #3 wrong answers
            puts "_|_"
        when 4
            #4 wrong answers
            puts " | "
            puts "_|_"
        when 5
            #5 wrong answers
            puts " | "
            puts " | "
            puts "_|_"
        when 6
            #6 wrong answers
            puts "  _ "
            puts " | "
            puts " | "
            puts " | "
            puts "_|_"
        when 7
            #7 wrong answers
            puts "  _ "
            puts " |/"
            puts " | "
            puts " | "
            puts "_|_"
        when 8
            #8 wrong answers
            puts "  _ _"
            puts " |/"
            puts " | "
            puts " | "
            puts "_|_"
        when 9
            #9 wrong answers
            puts "  _ __"
            puts " |/"
            puts " | "
            puts " | "
            puts "_|_"
        when 10
            #10 wrong answers
            puts "  _ ___"
            puts " |/"
            puts " | "
            puts " | "
            puts "_|_"
        when 11
            #11 wrong answers
            puts "            _ ___         "
            puts "           |/             "
            puts "           |              "
            puts "           |              "
            puts "          _|_             "
            puts "\n                        "
            puts "     END OF THE GAME      "
            puts "         LOSER            "      
    end

    puts "\n \n"
end


def game
    #Create two objects user1 and user2
    user1 = User.new()
    user2 = User.new()

    user1.points = 0 #inicialize user1 points
    user2.points = 0 #inicialize user2 points

    #First player name
    puts "First player"
    print "Whats your name? " 
    user1.name = gets #get first name 

    #Second player name
    puts "Second player"
    print "Whats your name? " 
    user2.name = gets #get second name

    puts "----------------------------------------------"
    puts user1.name 
    puts "What is your word?"
    #Get word from user1 as password
    user2.word = $stdin.noecho(&:gets)
    word2_length = user2.word.length() - 1 #length of word for second player

    guess = "" #inicialize guessing word

    for n in (1..word2_length)
        guess+="*" #make guess word as '*'
    end

    while guess.include? "*" and user2.points < 11
        puts `clear` #clear screen
        puts ("Player "+user2.name)
        puts "\n"
        puts ("Word: " + guess)
        puts "\n"
        hangman_print(user2.points) #print hangman
        puts "\n"
        puts "Your letter: "
        letter = STDIN.getch #input letter
        letter.chr #letter to character
        word = user2.word 
        word.chars() #convert word to table of characters
        correct = false #correct answear (defaul false)

        for i in (0...word2_length) 
            #search for letter in word
            letter2 = word[i] 
            letter2.chr
            if letter == letter2 #check if the same letter
                guess[i] = letter #change letter in guess
                correct = true #if correct answear set true
            end
        end
        
        if correct == false
            user2.points += 1 #add point if wrong answear
        end      
    end   

    puts `clear` #clear screen

    if user2.points == 11 
        hangman_print(user2.points) #if lose print hangman
    else
        print "Good Job!!!\n" #if win print good job
    end

    puts "----------------------------------------------"
    puts user2.name 
    puts "What is your word?"

    #Get word from user1 as password
    user1.word = $stdin.noecho(&:gets)

    word1_length = user1.word.length() - 1

    guess = ""

    for n in (1..word1_length)
        guess+="*"
    end

    while guess.include? "*" and user1.points < 11
        puts `clear`
        puts ("Player "+user1.name)
        puts "\n"
        puts ("Word: " + guess)
        puts "\n"
        hangman_print(user1.points) #print hangman
        puts "\n"
        puts "Your letter: "
        letter = STDIN.getch #input letter
        letter.chr #letter to character
        word = user1.word
        word.chars() #convert word to table of characters
        correct = false #if correct answear set true

        for i in (0...word1_length)
            #search for letter in word
            letter2 = word[i]
            letter2.chr
            if letter == letter2 #check if the same letter
                guess[i] = letter #change letter in guess
                correct = true #if correct answear set true
            end
        end
        
        if correct == false
            user1.points += 1 #add point if wrong answear
        end      
       
        puts `clear` #Clear screan

        if user1.points == 11 
            hangman_print(user1.points) #if lose print hangman
        else
            print "Good Job!!!\n" #if win print good job
        end
    end

    #Write who is the winner
    if user1.points > user2.points
        #Winner is user1
        puts "And the winner is " + user1.name
    elsif user1.points < user2.points 
        #Winner is user2
        puts "And the winner is " + user2.name
    else
        #It's a draw
        puts "Congratulations it's a draw"
    end

    puts "\n"
end

if __FILE__ == $0
    print `clear` #Clear screen before starting the game
    puts "----------------------------------------------"
    puts "\nWelcome to Hangman game" #Show it only once in program
    puts "\n----------------------------------------------"

    game #Start new game

end