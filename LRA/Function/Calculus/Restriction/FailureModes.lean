import LRA.Function.Calculus.Restriction.Definition

namespace LRA.Function

universe u v w

/--
`MultipleExtensions` TODO

Predicate logic:

  ∀ {SmallDomain : Type u} {LargeDomain : Type v} {Codomain : Type w} (original : LRA.Function SmallDomain Codomain) (inclusion : LRA.Function SmallDomain LargeDomain), Exists fun first => Exists fun second => (Ne first second ∧ (first.Extends original inclusion ∧ second.Extends original inclusion))

Predicate logic (unfolded):

  ∀ {SmallDomain : Type u} {LargeDomain : Type v} {Codomain : Type w} (original : SmallDomain → Codomain) (inclusion : SmallDomain → LargeDomain), Exists fun first => Exists fun second => (first = second → False ∧ (∀ (input : SmallDomain), first (inclusion input) = original input ∧ ∀ (input : SmallDomain), second (inclusion input) = original input))

Logical form (Lean):

```lean
def MultipleExtensions {SmallDomain : Type u} {LargeDomain : Type v} {Codomain : Type w}
    (original : LRA.Function SmallDomain Codomain)
    (inclusion : LRA.Function SmallDomain LargeDomain) : Prop :=
  ∃ first second : LRA.Function LargeDomain Codomain,
    first ≠ second ∧ Extends first original inclusion ∧ Extends second original inclusion
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use, unfold

-/
def MultipleExtensions {SmallDomain : Type u} {LargeDomain : Type v} {Codomain : Type w}
    (original : LRA.Function SmallDomain Codomain)
    (inclusion : LRA.Function SmallDomain LargeDomain) : Prop :=
  ∃ first second : LRA.Function LargeDomain Codomain,
    first ≠ second ∧ Extends first original inclusion ∧ Extends second original inclusion

end LRA.Function
