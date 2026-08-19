/-!
No quotient is taken in this construction.

Unlike a pairs-and-equivalence construction (the integers as pairs of
naturals, say), the von Neumann carrier is `ZFCSet` directly: ω's elements
*are* the natural numbers, not representatives of them. `ZFCSet` already
carries its own equality, given by the Extensionality axiom
(`LRA.Set.ZFC.Extensionality`), so there is no equivalence relation to
define or quotient by here.

This file exists as the role §1.6.1 reserves for it, per §2.3's rule that a
role file may be present and empty -- and stays that way rather than being
removed, so a reader looking for "what's the equivalence here" finds an
answer instead of a missing file.
-/
