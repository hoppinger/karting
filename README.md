
# Hoppinger Ice Karting Tournament

On April 22, 2016, Hoppinger held an Ice Karting Tournament at 
[De Uithof](http://www.deuithof.nl/). This repository contains all the data of
that day so it can be analysed.

## Tournament structure

All Hoppinger employees were divided in 4 teams. Every team drove 2 heats. Then
every team was sorted by the fastest lap time and then the first 2 of every team
drove a final heat. The 3 finalists that drove the fastest laps were the
winners of the tournament and received a cup.

## Analyses, visualisation and other insights

Raw data is nice, but generating better insights in data using code is even
better. Below is a list of the available analyses for the data.

  * __[Final ranking](https://github.com/hoppinger/karting/tree/master/analyses/ranking_finals)__  
    Contains a list of all the participants of the final heat ordered by their
    fastest lap.
  * __[Full ranking](https://github.com/hoppinger/karting/tree/master/analyses/ranking_fastest)__  
    Contains a list of all the participants of all heats ordered by their
    fastest lap.

## Contribute

If you write an analysis for this data, prefer Ruby. Create a directory in the
`analyses` folder in which the code that runs your analysis and the results of
it are located. If it's in any way possible, please provide a `README.md` file
that shortly explains the results of the analysis and actually shows those
results. The best would be that the output of your script is the `README.md`
file. Take a look at the `ranking_fastest` and `ranking_finals` analyses for
examples. Finally, file a Pull Request for your analysis, so we can merge it in.

If you spot an error in the data, please file an issue, so we can check the 
numbers in the printed timesheets.

## Data structure

In the `teams` directory there is a file per team in which the team members are
listed. In the `heats` directory, there is file per heat, in which the drivers
of the heat are listed with their lap times (in seconds)

## Things to note

* The time-keeping tool of the karting venue does not support lap times higher
  than 99 seconds. Those laps are recorded as `> 99` in the time sheet we
  received. In the YAML files, they are listed as `~`, which is parsed to `nil`
  in  Ruby. Those laps are however calculated into the average lap time that is
  in the  time sheet, which is also listed in the YAML files.
* Wouter van der Meulen's first heat was not tracked, because of a technical
  failure in the tracking device.
* Some team members choose not to drive and are not in the heat data.
 
