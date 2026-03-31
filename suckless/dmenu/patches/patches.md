# Patches

All patches could be found at this [link](https://tools.suckless.org/dmenu/patches/).

## Table of Contents

<!-- vim-markdown-toc GFM -->

* [Usage](#usage)
* [border](#border)
  * [Description](#description)
  * [Authors](#authors)
* [center](#center)
  * [Description](#description-1)
  * [Authors](#authors-1)
* [fuzzymatch](#fuzzymatch)
  * [Description](#description-2)
  * [Authors](#authors-2)
  * [Note](#note)
* [Instant Mode](#instant-mode)
  * [Description](#description-3)
  * [Authors](#authors-3)
* [Line height](#line-height)
  * [Description](#description-4)
  * [Authors](#authors-4)
* [navhistory](#navhistory)
  * [Description](#description-5)
  * [Authors](#authors-5)
* [numbers](#numbers)
  * [Description](#description-6)
  * [Authors](#authors-6)
* [Password](#password)
  * [Description](#description-7)
  * [Authors](#authors-7)
* [print input text](#print-input-text)
  * [Description](#description-8)
  * [Usage in Surf](#usage-in-surf)
  * [Authors](#authors-8)
* [symbols](#symbols)
  * [Description](#description-9)
  * [Authors](#authors-9)

<!-- vim-markdown-toc -->

## Usage

```shell
# in dmenu folder
$ patch < patches/<patch file>
$ rm -f config.h
$ sudo make clean install
```

## border

**File**: `dmenu-border-4.9.diff`

### Description

This patch adds a border around the dmenu window. It is intended to be used with the center or xyw patches, to make the menu stand out from similarly coloured windows.

### Authors

+ Leon Plickat [leonhenrik.plickat@stud.uni-goettingen.de](mailto:leonhenrik.plickat@stud.uni-goettingen.de)

![border patch](https://tools.suckless.org/dmenu/patches/border/dmenu_border.png)

## center

**File**: `dmenu-center-20191105-f1ca0d0.diff`

### Description

This patch centers dmenu in the middle of the screen. With `dmenu-center-20191105-f1ca0d0.diff`, you can use *-c* to center dmenu.

### Authors

+ Ed van Bruggen [edvb@uw.edu](mailto:edvb@uw.edu)
+ Nihal Jere [nihal@nihal.jere.xyz](mailto:nihal@nihal.jere.xyz) (20191105)

## fuzzymatch

**File**: `dmenu-fuzzymatch-4.9.diff`

### Description

This patch adds support for fuzz-matching to dmenu, allowing users to type non-consecutive portions of the string to be matched. Adds the option *fuzzy* to `config.def.h` and the flag *-F* to dmenu which enable to turn fuzzy-matching on and off.

### Authors

+ Jan Christoph Ebersbach [jceb@e-jc.de](mailto:jceb@e-jc.de)
+ Laslo Hunhold [dev@frign.de](mailto:dev@frign.de) (dmenu-4.6)
+ Aleksandrs Stier (4.9)

### Note

+ Supports dmenu's case insensitive switch (-i)
+ This patch enables fuzzy-matching as default, and use the flag *-F* to turn off it. You can change this by modify these codes:

```c
// change fuzzy to 0 to disable fuzzy-matching as default, in config.def.h
static int fuzzy = 0;
// change fuzzy to 1 to enable fuzzy-matching by the flag -F, in dmenu.c
else if (!strcmp(argv[i], "-F"))
        fuzzy = 1;
```

## Instant Mode

**File**: `dmenu-instant-4.7.diff`

### Description

Adds an flag which will cause dmenu to select an item immediately if theres one matching option left.

### Authors

+ Michael Stummvoll (stummi) [suckless@stummi.org](mailto:suckless@stummi.org)

## Line height

**File**: `dmenu-lineheight-4.9.diff`

### Description

The patch adds a *-h* option, which sets the minimum height of a dmenu line. This helps integrate dmenu with other UI elements that require a particular vertical size.

### Authors

+ Xarchus
+ Jonathon Fernyhough (jonathon at manjaro-dot-org) (4.7 rewrite)
+ Aleksandrs Stier (4.9 port)

![with '-h 24'](http://tools.suckless.org/dmenu/patches/line-height/dmenu-line-height.png)

## navhistory

**File**: `dmenu-navhistory-4.6.diff`

### Description

This patch provides dmenu the ability for history navigation similar to that of bash. Press `alt+p` for the previous history and `alt+n` for the next. Use *-H* option to specify a file to store input history.

### Authors

+ phi [crispyfrog@163.com](mailto:crispyfrog@163.com)

## numbers

**File**: `dmenu-numbers-4.9.diff`

### Description

Adds text which displays the number of matched and total items in the top right corner of dmenu.

### Authors

+ Miles Alan [m@milesalan.com](mailto:m@milesalan.com)

![example](https://tools.suckless.org/dmenu/patches/numbers/dmenu-numbers.png)

## Password

**File**: `dmenu-password-4.9.diff`

### Description

By applying this patch, dmenu will not directly display the keyboard input, but instead replace it with dots. All data from stdin will be ignored. Use *-P* to activate.

### Authors

+ Philip K. [philippija@gmail.com](mailto:philippija@gmail.com)

## print input text

**File**: `dmenu-printinputtext-20190822-bbc464d.diff`

### Description

This patch adds a flag *-t* which makes Return key to ignore selection and print the input text to stdout. The flag basically swaps the functions of Return and Shift+Return hotkeys.

The default behaviour of dmenu makes sense when selecting from given options (i.e. as a program launcher) but it is annoying when you might be entering text that is different than the given options (i.e. as surf's url bar).

### Usage in Surf

Just add the *-t* flag to the dmenu in the SETPROP function of surf's config.def.h. Now the url bar should behave just like in all other browsers.

### Authors

+ efe [efe@efe.kim](mailto:efe@efe.kim)

## symbols

**File**: `dmenu-symbols-4.9.diff`

### Description

Add the settings *symbol_1* and *symbol_2* to config.def.h. These enable to define the symbols which are printed in dmenu to indicate that either the input is too long or there are too many options to be shown in dmenu in one line.

### Authors

+ Aleksandrs Stier

