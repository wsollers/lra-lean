import LRA.VolumeI.Logic.Language
import LRA.VolumeI.Logic.Model
import LRA.VolumeI.Logic.Proof
import LRA.VolumeI.Logic.Syntax
import LRA.VolumeI.Logic.Semantics

/-!
Aggregate import shim for everything currently under `VolumeI/Logic/`.

`Language` (vocabulary: similarity type plus shared logical symbols),
`Model` (domain plus interpretation of a signature's vocabulary), `Proof`
(proof systems and derivability), `Syntax` (terms and propositional
formulas), and `Semantics` (term evaluation, and eventually first-order
formula satisfaction) exist so far. This file is expected to grow, not to
be written once and left alone.
-/
