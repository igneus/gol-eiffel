[Game of Life][gol] implemented in Eiffel.

Exercise in elementary Eiffel programming and
experiment in portability of code targeting [Liberty Eiffel][liberty]
to the other available Eiffel compilers.

## Prerequisites

Any of

- [Liberty Eiffel][liberty] (tested with latest development version)
- ISE Eiffel (tested with [GPL][isegpl] 19.05)
- [Gobo Eiffel][gobo] (tested with development version post-22.01)

## Building and Execution

### Liberty

```
$ make
$ ./gol
```

### ISE

```
$ make with_ise
$ ./EIFGENs/gol/W_code/gol
```

Or open the project in EiffelStudio and use the UI to compile and run
the program. `gol.ecf` is the relevant EiffelStudio project file.

### Gobo

```
$ make with_gobo
$ ./gol_gobo
```

## Options

If executed without arguments the program runs with a simple
built-in pattern.

A file in a [simple plaintext format][plaintext] can be specified
on the command line:

```
$ ./gol input.cells
```

If `-` is passed as filename, pattern is read from the standard
input:

```
$ curl https://conwaylife.com/patterns/xwsstagalong.cells | ./gol -
```

## Project Structure

- `src/` main cluster, targeting Liberty Eiffel and mostly compilable also by the other compilers
- `ise_src/` [override cluster][ise_override] overriding some classes in order to make the codebase compilable with ISE and Gobo

[gol]: https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life
[liberty]: http://www.liberty-eiffel.org/
[isegpl]: https://sourceforge.net/projects/eiffelstudio/
[gobo]: https://github.com/gobo-eiffel/gobo
[ise_override]: https://www.eiffel.org/doc/eiffelstudio/Group_Options
[plaintext]: https://conwaylife.com/wiki/Plaintext
