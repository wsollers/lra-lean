import LRA.VolumeI.Logic.Language
import LRA.VolumeI.Logic.Model
import LRA.VolumeI.Logic.Theory
import LRA.VolumeI.Logic.Proof
import LRA.VolumeI.Logic.Syntax
import LRA.VolumeI.Logic.Semantics

/-!
Aggregate import for everything currently under `VolumeI/Logic/`.

`Language` (vocabulary: similarity type plus shared logical symbols),
`Model` (domain plus interpretation of a signature's vocabulary), `Proof`
(proof systems and derivability), `Theory` (collections of formulas/sentences
and their model classes), `Syntax` (terms and propositional formulas), and
`Semantics` (term evaluation and satisfaction) exist so far. This file is
expected to grow, not to be written once and left alone.
-/
