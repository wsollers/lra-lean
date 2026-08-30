import LRA.Metamathematics.Notation
import LRA.Metamathematics.DeclarationKeywords

/-!
Metamathematics aggregate.

`LRA.Metamathematics` collects syntactic/metatheoretic infrastructure that
sits conceptually prior to `LRA.Logic`'s own syntax and semantics
definitions: bare symbol-notation types (`LogicalConnective`,
`LogicalEquality`, `LogicalQuantifier`, under `Notation`) and the custom
`proposition`/`corollary` declaration-command macros used throughout the
repository (`DeclarationKeywords`).

These are metatheoretic in the sense that they describe the language and
its presentation, not facts stated or proved *within* the object language
`LRA.Logic` goes on to define.
-/
