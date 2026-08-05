import LRA.VolumeI.Identity.Language
import LRA.VolumeI.Identity.Model
import LRA.VolumeI.Identity.Theory
import LRA.VolumeI.Identity.Native
import LRA.VolumeI.Identity.ProofPatterns
import LRA.VolumeI.Identity.Equality
import LRA.VolumeI.Identity.Substitution
import LRA.VolumeI.Identity.Extensionality
import LRA.VolumeI.Identity.EqualityCongruence
import LRA.VolumeI.Identity.Axioms

/-!
Aggregate import for the small Axiomatic Equality chapter.

This chapter fixes the pure language `L_=` with no non-logical symbols, models
equality as the diagonal identity relation on a nonempty carrier, takes
reflexivity and Leibniz substitution as the primitive theory, and exposes the
derived equality machinery used by predicate logic, set theory, functions,
relations, and algebra.
-/
