import LRA.Logic.Language
import LRA.Logic.Model
import LRA.Logic.Theory
import LRA.Logic.Proof
import LRA.Logic.Syntax
import LRA.Logic.Semantics

/-!
Canonical Logic subject.

`Language` (vocabulary: similarity type plus shared logical symbols),
`Model` (domain plus interpretation of a signature's vocabulary), `Proof`
(proof systems and derivability), `Theory` (collections of formulas/sentences
and their model classes), `Syntax` (terms and propositional formulas), and
`Semantics` (term evaluation and satisfaction) exist so far. This router aggregates the groups and owns no declarations of its own.
-/
