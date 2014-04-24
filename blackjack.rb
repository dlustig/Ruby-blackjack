#Dan Lustig
#4/24/14
#Ruby
#blackjack

def blackjack
    promt
end

def promt
    puts "Welcome to BlackJack. The goal of the game is to achieve a card combination of 21. Good Luck!"
    game_plan
end

def game_plan
    playing = 1
    cards = []
    total = first_move(cards)
    while playing == 1
        total = counting(cards)
        if total == 21
            puts "!!!! **** BlackJack **** !!!!"
            exit
        end
        if total > 21
            puts "!!!! **** Bust **** !!!!"
            exit
        end
        play(cards)
    end
end

def first_move(cards)
    deal(cards)
    deal(cards)
    total(cards)
end

def deal(cards)
    cardVal = rand(2..11)
    total = counting(cards)
    if (cardVal == 11) 
        if ((total + 11) > 21)
            cardVal = 1
        end
        
    end
        
    printCard = ""
    cardCase = rand(3)
    if cardCase == 0
        printCard = "Heart"
    end
    if cardCase == 1
        printCard = "Spade"
    end
    if cardCase == 2
        printCard = "Club"
    end
    if cardCase == 3
        printCard = "Diamond"
    end
    puts "You have been dealt a #{printCard} with a value of #{cardVal}"
    cards << cardVal
end

def total(cards)
    total = 0
    cards.each do |count|
        total += count
    end
    puts "The sum of the cards you have been dealt is #{total}"
    total
    
end

def counting(cards)
    total = 0
    cards.each do |count|
        total += count
    end
    total
end

def play(cards)
    puts "Would you like to hit or stay (h/s)?"
    response = gets.chomp.downcase
    if response == "s" && total(cards) < 21
        puts "The cards you have been dealt is under 21. I'm sorry, you lose!"
        exit
        else
        deal(cards)
        total(cards)
        playing = true
    end  
end

blackjack
