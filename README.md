[Game of Life][gol] implemented in Eiffel.

Exercise in elementary Eiffel programming and
experiment in portability of code targeting [Liberty Eiffel][liberty]
to the other available Eiffel compilers.

## Prerequisites

Any of

- [Liberty Eiffel][liberty] (tested with latest development version)
- ISE Eiffel (tested with [GPL][isegpl] 19.05)

## Building and Execution

### Liberty

`$ make`
`$ ./gol`

### ISE

`$ make with_ise`
`$ ./EIFGENs/gol/W_code/gol`

(Or open the project in EiffelStudio and use the UI to compile and run
the program. `gol.ecf` is the relevant EiffelStudio project file.)

## Running tests

Add path to this repo's `src` subdirectory to the `Loadpath` section
of your `~/.config/liberty-eiffel/liberty.se`, then:

`$ make test`

[gol]: https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life
[liberty]: http://www.liberty-eiffel.org/
[isegpl]: https://sourceforge.net/projects/eiffelstudio/
