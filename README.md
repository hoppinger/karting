
# Hoppinger Ice Karting Tournament

On April 22, 2016, Hoppinger held an Ice Karting Tournament at 
[De Uithof](http://www.deuithof.nl/). This repository contains all the data of
that day so it can be analysed.

## Tournament structure

All Hoppinger employees were divided in 4 teams. Every team drove 2 heats. Then
every team was sorted by the fastest lap time and then the first 2 of every team
drove a final heat. The 3 finalists that drove the fastest laps were the
winners of the tournament and received a cup.

## Data structure

In the `teams` directory there is a file per team in which the team members are
listed. In the `heats` directory, there is file per heat, in which the drivers
of the heat are listed with their lap times.

## Things to note

* The time-keeping tool of the karting venue does not support lap times higher
  than 99 seconds. Those laps are recorded as `> 99` in the time sheet we
  received. In the YAML files, they are listed as `~`, which is parsed to `nil`
  in  Ruby. Those laps are however calculated into the average lap time that is
  in the  time sheet, which is also listed in the YAML files.
* Wouter van der Meulen's first heat was not tracked, because of a technical
  failure in the tracking device.
* Some team members choose not to drive and are not in the heat data.
 