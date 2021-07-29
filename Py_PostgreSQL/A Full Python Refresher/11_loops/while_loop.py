# While loop
number = 7

while user_input != "n":
    user_input = input("Would you like to play? (Y/n)")
    if user_input == "n":
        break
    user_number = int(input("Guess our number:"))
    if user_number == number:
        print("You've guessed right!")
    elif abs(number - user_number) == 1:
        print("Your off by one")
    else:
        print("Sorry, try again!")
