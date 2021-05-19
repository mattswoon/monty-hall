module monty

using Random

"""
The player's strategy is to either switch after monty chooses a door,
or stay
"""
@enum Strategy switch stay

"""
Player either wins a car (a "win" allegedly)
or a goat.
"""
@enum Prize car goat

"""
There are three doors, behind two of which are goats while the third
hides a car.

The game is played in two rounds, first the player picks a door. 
Monty (the game show host) then opens one of the other doors to reveal
a goat and offers the player the chance to switch to the third door, 
or stay with their first pick.

This function runs a game for a player with a given strategy (stay or switch).
"""
function game(strategy::Strategy)::Prize
    # all possible combinations of goat and car behind doors 1, 2 and 3
    options = [(goat, goat, car),
               (goat, car, goat),
               (car, goat, goat)]

    # draw a random configuration
    doors = rand(options)
    # this is the door with the car
    door_with_car = findfirst(x -> x == car, doors)

    # player's first pick, they select a door at random
    first_pick = rand([1,2,3])
    other_doors = setdiff(Set([1,2,3]), first_pick)

    # from the other doors, monty picks the one with a goat to reveal
    monty_picks = setdiff(other_doors, door_with_car) |> first

    if strategy == switch
        # if the player switches, we choose the remaining door
        door_picked = setdiff(Set([1,2,3]), Set([first_pick, monty_picks])) |> first
    else
        # otherwise we stick with our first pick
        door_picked = first_pick
    end

    # and this is the prize!
    prize = doors[door_picked]
    return prize
end

"""
Runs `n_iterations` of the game, all with a given strategy and returns
the number of wins (player gets a car).
"""
function run(n_iterations::Int64, strategy::Strategy)
    mapreduce(
        x -> game(strategy),
        (acc, p) -> p == car ? acc + 1 : acc,
        1:n_iterations,
        init=0
    )
end

end # module
