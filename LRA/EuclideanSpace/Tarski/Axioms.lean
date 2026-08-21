import LRA.EuclideanSpace.Tarski.Axioms.CongruenceReflexivity
import LRA.EuclideanSpace.Tarski.Axioms.CongruenceTransitivity
import LRA.EuclideanSpace.Tarski.Axioms.CongruenceIdentity
import LRA.EuclideanSpace.Tarski.Axioms.SegmentConstruction
import LRA.EuclideanSpace.Tarski.Axioms.FiveSegment
import LRA.EuclideanSpace.Tarski.Axioms.BetweennessIdentity
import LRA.EuclideanSpace.Tarski.Axioms.InnerPasch
import LRA.EuclideanSpace.Tarski.Axioms.LowerDimension
import LRA.EuclideanSpace.Tarski.Axioms.UpperDimension
import LRA.EuclideanSpace.Tarski.Axioms.Playfair
import LRA.EuclideanSpace.Tarski.Axioms.Continuity

/-!
Aggregate import for Tarski's eleven axioms of `E_n`, mirroring
`LRA.Set.ZFC.Axioms`'s own one-file-per-axiom layout.

Congruence axioms (1-5): `CongruenceReflexivity`, `CongruenceTransitivity`,
`CongruenceIdentity`, `SegmentConstruction`, `FiveSegment`.

Betweenness/order axioms (6-7): `BetweennessIdentity`, `InnerPasch`.

Dimension axioms (8-9): `LowerDimension`, `UpperDimension`. These reuse
the generic `AffinelyIndependent`/`CoincidesOrDeterminedByDistances`
from `LRA.EuclideanSpace.Interface.Laws` (applied at `TarskiPoint`),
which are honestly `sorry`-valued (not yet formalized from `Between`/
`Congruent` alone) rather than given an unverified general-`n`
definition -- axioms 8-9 are consequently vacuous until that gap is
closed, in exactly one place shared with every other backend.

Parallel axiom (10): `Playfair` -- stateable purely from `Between`, no
gap.

Continuity schema (11): `Continuity` -- formalized by quantifying over
`TarskiPoint → Prop` directly rather than over `L_geom`-formulas; see
`Continuity.lean`'s module doc for why that is a faithful choice, not
an invented shortcut.
-/
