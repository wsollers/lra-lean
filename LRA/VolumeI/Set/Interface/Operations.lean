namespace LRA.VolumeI.Set

universe u

/-!
Operation classes for the three set operations Lean core has no notation
class for: absolute complement, universal set, and symmetric difference.

Lean core already supplies `Union`, `Inter`, `HasSubset`,
`EmptyCollection`, `SDiff`, and `Membership`; backends register against
those directly (`Enderton/Instances.lean`, `LRASet/Instances.lean`). The
three classes below fill the remaining gaps in exactly the same style:
data only, no laws. Laws about these operations live in the law classes
under `Interface/Fluent/`, which take these classes as instance
parameters -- the same machine/certificate split used everywhere else.

Naming: `HasComplement`/`HasUniversal`/`HasSymmDiff` deliberately avoid
Mathlib's names (`HasCompl`, `Top`, `symmDiff`) so a future
Mathlib-backed adapter can bridge the two without declaration collisions.
The notation tokens themselves (`ᶜ`, `∆`) do coincide with Mathlib's and
are declared `scoped` here for that reason: they are active inside the
`LRA.VolumeI.Set` namespace tree and invisible outside it.
-/

/-- Absolute complement, written `Aᶜ`.

Only a backend with a universal set can register this: `LRASet` can
(`Complement` is just pointwise negation of the predicate); Enderton
structurally cannot -- the complement of a set relative to *everything*
is never a set, by Russell's paradox. -/
class HasComplement (α : Type u) where
  complement : α → α

scoped postfix:1024 "ᶜ" => HasComplement.complement

/-- The universal set, written `𝒰`. Same registration caveat as
`HasComplement`: `LRASet` has one (the always-true predicate); Enderton
cannot. -/
class HasUniversal (α : Type u) where
  universal : α

scoped notation "𝒰" => HasUniversal.universal

/-- Symmetric difference, written `A ∆ B`.

No universal set required: any backend with union and relative
complement can derive it, so both `LRASet` and (once it derives the
operation) Enderton can register this. -/
class HasSymmDiff (α : Type u) where
  symmDiff : α → α → α

scoped infixl:100 " ∆ " => HasSymmDiff.symmDiff

end LRA.VolumeI.Set
