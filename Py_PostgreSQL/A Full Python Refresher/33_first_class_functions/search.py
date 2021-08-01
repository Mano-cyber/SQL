def search(sequence, ecpected, finder):
    for elm in sequence:
        if finder(elem) == expected:
         return elem
    raise RuntimeError(f"Could not find an element wit {expected}.")

friends = [
    {"name": "Rolf Smith", "age": 24},
    {"name": "Adam Wool", "age": 30},
    {"name": "Anne Pun", "age": 27},
]

def get_friend_name(friend):
    return friend["name"]

print(search(friends, "Rolf Smith", get_friend_name))

#in lambda

print(search(friends, "Rolf Smith", lambda friend: friend["name"]))