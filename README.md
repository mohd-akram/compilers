Compilers
=========

This module contains a list of compilers along with some metadata.

    npm install compilers.js

To use it:

```javascript
const { COMPILERS } = require('compilers.js');
```

Examples
--------

 - [Language Graph](https://github.com/mohd-akram/languages)

Contributing
------------

This list aims to be comprehensive while at the same time not populated with
unused or defunct compilers. Similarly, the source or target language of any
compiler should be either widely used or if it is an intermediate
representation, it must be accepted or targeted by other compilers.

If a compiler is missing from the list that satisfies this criteria,
feel free to create a pull request, by editing the
[src/compilers.coffee](https://github.com/mohd-akram/compilers/blob/master/src/compilers.coffee)
file. Make sure to place the new entry in alphabetical order
within the appropriate section: Assembler, Intermediate, JIT, Native, or Transpiler
(see the existing entries to get a feel of where the new entry fits best).
