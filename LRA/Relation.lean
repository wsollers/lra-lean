import LRA.Relation.Definition
import LRA.Relation.Canonical
import LRA.Relation.Properties
import LRA.Relation.Structures
import LRA.Relation.Operations
import LRA.Relation.Calculus
import LRA.VolumeI.Relations.Equivalence
import LRA.VolumeI.Relations.WellFounded.All

/-!
Canonical Relation subject.

The subject is organized as canonical relations, primitive properties,
relation-producing operations, relation/set calculus, and named relation
structures. Function and Map should specialize this layer rather than redefine
its generic image, preimage, domain, range, and fiber concepts.
-/
