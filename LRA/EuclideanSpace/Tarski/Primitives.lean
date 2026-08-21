import LRA.EuclideanSpace.Interface.Relations

namespace LRA.EuclideanSpace

/-!
The primitive, opaque carrier and relations of the in-house axiomatic
realization of Tarski's `E_n`, mirroring `LRA.Set.ZFCSet.Primitives`'
`axiom ZFCSet : Type` / `axiom ZFCMembership : ...` pattern: introduce
the vocabulary as genuine Lean axioms about a fresh opaque type, rather
than defining it computationally. Tarski's language has two primitive
relations, not one -- unlike ZFC's single `∈`, neither `TarskiBetween`
nor `TarskiCongruent` is defined from the other.

The `Between`/`Congruent` instances are wired here, alongside the
primitives, for the same reason `ZFCSet/Primitives.lean` wires its own
`Membership` instance alongside `ZFCMembership`: it lets every later
file in this folder (in particular the dimension axioms, which need the
generic `Interface` predicates applied at `TarskiPoint`) refer to
`between`/`congruent` generically from the start.
-/

/-- The primitive single-sorted carrier ("points") of the in-house
Tarski realization. -/
axiom TarskiPoint : Type

/-- Primitive betweenness: `TarskiBetween x y z` is Tarski's `B(x, y, z)`
-- `y` lies on the segment `xz`. -/
axiom TarskiBetween : TarskiPoint → TarskiPoint → TarskiPoint → Prop

/-- Primitive congruence: `TarskiCongruent x y z w` is Tarski's `xy ≡ zw`
-- segment `xy` has the same length as segment `zw`. -/
axiom TarskiCongruent : TarskiPoint → TarskiPoint → TarskiPoint → TarskiPoint → Prop

instance : Between TarskiPoint := ⟨TarskiBetween⟩
instance : Congruent TarskiPoint := ⟨TarskiCongruent⟩

end LRA.EuclideanSpace
