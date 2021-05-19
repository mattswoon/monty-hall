using monty

function main(args)
    N = parse(Int64, first(args))
    strategy = monty.switch
    wins = monty.run(N, strategy)
    println("Using the switch strategy for $N simulations")
    println("\tNumber of wins: $wins")
    println("\tOdds: $(wins / N * 100)%")
    println("")

    strategy = monty.stay
    wins = monty.run(N, strategy)
    println("Using the stay strategy for $N simulations")
    println("\tNumber of wins: $wins")
    println("\tOdds: $(wins / N * 100)%")
    println("")
end

main(ARGS)
