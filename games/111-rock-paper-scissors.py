from random import randint

def play(player):
    global score
    options = ["rock", "paper", "scissors"] # Map randint results with text
    bot = randint(0, 2)
    print("Bot picked " + options[bot] + ".")
    if player == bot:
        print("It's a tie!")
    elif player == bot+1 or player == bot-2: # Win conditions (rock = scissors-2, paper = rock+1, scissors = paper+1)
        score += 1
        print("You win!")
    else:
        score -= 1
        print("You lose :(")

score = 0
game = True

while game:
    print("\nMake a choice (rock, paper, scissors, exit)")
    choice = input()
    if choice == "exit":
        print("Your score: " + str(score))
        game = False
    elif choice == "rock":
        play(0)
    elif choice == "paper":
        play(1)
    elif choice == "scissors":
        play(2)
    else:
        print("Incorrect choice")
