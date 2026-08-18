import LRA.Function.Definition

/-!
Worked functions at concrete carriers.

`Examples.lean` is a quarantined leaf (§2.3, §6): no core `Definition`,
`Theorems`, `Characterizations`, `Consequences`, `Relationships`, or router may
import it. It is compiled from a test-library module instead, so it stays under
a Lake target without entering the production aggregates.
-/

namespace LRA.Function.Examples

universe u v

/-- Every Boolean collapses to the single unit value: not injective. -/
def collapse : LRA.Function Bool Unit :=
  fun _ => ()

/-- Successor on the naturals: injective but not surjective, since it misses zero. -/
def shift : Endofunction Nat :=
  Nat.succ

/-- The empty function out of `Empty`, vacuously injective. -/
def vacuous : LRA.Function Empty Bool :=
  fun input => nomatch input

/-- Boolean negation: a bijection of a carrier with itself. -/
def swap : Endofunction Bool :=
  fun input => !input

/-- The constant function at a chosen output. -/
def constant {Domain : Type u} {Codomain : Type v}
    (output : Codomain) : LRA.Function Domain Codomain :=
  fun _ => output

end LRA.Function.Examples
