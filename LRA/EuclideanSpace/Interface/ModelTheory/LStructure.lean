import LRA.EuclideanSpace.Interface.Signature
import LRA.ModelTheory.Model

namespace LRA.EuclideanSpace

universe u

/--
`TarskiStructure` TODO

Predicate logic:

  abbrev TarskiStructure := LRA.ModelTheory.FirstOrder.Model TarskiFirstOrderSignature

Predicate logic (unfolded):

  abbrev TarskiStructure := LRA.ModelTheory.FirstOrder.Model TarskiFirstOrderSignature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev TarskiStructure := LRA.ModelTheory.FirstOrder.Model TarskiFirstOrderSignature
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev TarskiStructure := LRA.ModelTheory.FirstOrder.Model TarskiFirstOrderSignature

/--
`BuildTarskiStructure` TODO

Predicate logic:

  def BuildTarskiStructure {Point : Type u} [Nonempty Point]
    (between : Point -> Point -> Point -> Prop)
    (congruent : Point -> Point -> Point -> Point -> Prop) :
    TarskiStructure where
  Domain

Predicate logic (unfolded):

  def BuildTarskiStructure {Point : Type u} [Nonempty Point]
    (between : Point -> Point -> Point -> Prop)
    (congruent : Point -> Point -> Point -> Point -> Prop) :
    TarskiStructure where
  Domain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildTarskiStructure {Point : Type u} [Nonempty Point]
    (between : Point -> Point -> Point -> Prop)
    (congruent : Point -> Point -> Point -> Point -> Prop) :
    TarskiStructure where
  Domain
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def BuildTarskiStructure {Point : Type u} [Nonempty Point]
    (between : Point -> Point -> Point -> Prop)
    (congruent : Point -> Point -> Point -> Point -> Prop) :
    TarskiStructure where
  Domain := Point
  domainNonempty := inferInstance
  interpretFunction := fun symbol _ => symbol.elim
  interpretRelation
    | .between, args =>
        between (args ⟨0, by decide⟩) (args ⟨1, by decide⟩) (args ⟨2, by decide⟩)
    | .congruent, args =>
        congruent (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
          (args ⟨2, by decide⟩) (args ⟨3, by decide⟩)
  interpretConstant := fun symbol => symbol.elim

/--
`BuildTarskiModel` TODO

Predicate logic:

  abbrev BuildTarskiModel := @BuildTarskiStructure

Predicate logic (unfolded):

  abbrev BuildTarskiModel := @BuildTarskiStructure (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev BuildTarskiModel := @BuildTarskiStructure
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev BuildTarskiModel := @BuildTarskiStructure

end LRA.EuclideanSpace
