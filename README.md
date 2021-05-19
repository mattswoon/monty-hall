# The Monty Hall problem as a computer simulation

The [Monty Hall problem](https://en.wikipedia.org/wiki/Monty_Hall_problem)
is a probability problem with a counter intuitive result.

From wikipedia, the problem is stated as

> Suppose you're on a game show, and you're given the choice of three doors: Behind one door is a car; behind the others, goats. You pick a door, say No. 1, and the host, who knows what's behind the doors, opens another door, say No. 3, which has a goat. He then says to you, "Do you want to pick door No. 2?" Is it to your advantage to switch your choice?

At face value, it seems there's no advantage to sticking with your first choice or switching doors - 
there's two doors left and one has the prize so it seems the odds of winning are 50/50, but 
in actuality there's a 2/3 chance of winning the car if you switch from your original decision!

You can read the wikipedia article to convince yourself why, but maybe you only trust computers to simulate
these things for you. This repository contains a simulation of the monty hall problem written in [Julia](https://julialang.org/).
You can execute it from the command line after cloning this repository (and changing into the base directory with)

```
> julia --project=. main.jl 1000
```

where the `1000` is the number of games you wish to simulate to get your sample size. An example output is

```
> julia --project=. main.jl 1000000
Using the switch strategy for 1000000 simulations
	Number of wins: 666452
	Odds: 66.6452%

Using the stay strategy for 1000000 simulations
	Number of wins: 333625
	Odds: 33.3625%
```
