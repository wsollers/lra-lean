-- LRA/VolumeI/Foundations/Tuple.lean
--
-- The shared bottom layer for both siblings of the signature:
-- relations (Sets/Relations.lean) and operations (Algebra/Operations.lean)
-- are both built on arity-`n` tuples and the `pair` constructor below.
--
-- Design note — canonical indices i₀, i₁:
--   A 2-tuple is indexed by `Fin 2`. We deliberately use explicit
--   `Fin.mk` indices (⟨0, _⟩, ⟨1, _⟩) rather than the numeric literals
--   `(0 : Fin 2)` / `(1 : Fin 2)`. The literal form routes through
--   `OfNat` → `Nat.mod`, whose well-founded recursion does NOT reduce
--   under `rfl`, which would block the characterization lemmas downstream
--   (holds_equality, apply_natAddition, …). The `Fin.mk` form has a
--   definitional `.val`, so every accessor reduction closes by `rfl`.

namespace LRA.VolumeI.Foundations

/-- An arity-`n` tuple over `α`: a function from `n` indices to `α`.
    Arity lives in the type, so it is known at compile time and recoverable
    even for the empty tuple-set. -/
abbrev Tuple (α : Type) (n : Nat) : Type := Fin n → α

/-- The first canonical index of a 2-tuple (explicit `Fin.mk`). -/
def i₀ : Fin 2 := ⟨0, by decide⟩

/-- The second canonical index of a 2-tuple (explicit `Fin.mk`). -/
def i₁ : Fin 2 := ⟨1, by decide⟩

/-- The 2-tuple built from an ordered pair of elements.
    Slot 0 holds `first`, every other slot holds `second`. -/
def pair {α : Type} (first second : α) : Tuple α 2 :=
  fun index => if index.val = 0 then first else second

-- ── Fork probe ──────────────────────────────────────────────────
-- These two `rfl`s ARE the tuple-vs-curried experiment. If they hold,
-- the characterization-lemma pattern (one `rfl`/`Iff.rfl` per concrete
-- relation/operation) is clean and the whole tuple form is confirmed.

/-- The first slot of `pair a b` reads back `a`. -/
theorem pair_fst {α : Type} (a b : α) : pair a b i₀ = a := rfl

/-- The second slot of `pair a b` reads back `b`. -/
theorem pair_snd {α : Type} (a b : α) : pair a b i₁ = b := rfl

end LRA.VolumeI.Foundations
