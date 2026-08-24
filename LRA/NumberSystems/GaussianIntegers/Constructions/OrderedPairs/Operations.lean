
import LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.WellFoundedness

namespace LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs

variable {R : Type u}

instance [Add R] : Add (GaussianInteger R) :=
  ⟨fun first second =>
    ⟨first.realPart + second.realPart,
     first.imaginaryPart + second.imaginaryPart⟩⟩

instance [Neg R] : Neg (GaussianInteger R) :=
  ⟨fun value => ⟨-value.realPart, -value.imaginaryPart⟩⟩

instance [Add R] [Neg R] : Sub (GaussianInteger R) :=
  ⟨fun first second => first + -second⟩

instance [Add R] [Mul R] [Neg R] : Mul (GaussianInteger R) :=
  ⟨fun first second =>
    ⟨first.realPart * second.realPart +
       -(first.imaginaryPart * second.imaginaryPart),
     first.realPart * second.imaginaryPart +
       first.imaginaryPart * second.realPart⟩⟩

/--
`conjugation` TODO

Predicate logic:

  def conjugation [Neg R] (value : GaussianInteger R) : GaussianInteger R :=
  ⟨value.realPart, -value.imaginaryPart⟩

Predicate logic (unfolded):

  def conjugation [Neg R] (value : GaussianInteger R) : GaussianInteger R :=
  ⟨value.realPart, -value.imaginaryPart⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def conjugation [Neg R] (value : GaussianInteger R) : GaussianInteger R :=
  ⟨value.realPart, -value.imaginaryPart⟩
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
def conjugation [Neg R] (value : GaussianInteger R) : GaussianInteger R :=
  ⟨value.realPart, -value.imaginaryPart⟩

/--
`normSquared` TODO

Predicate logic:

  def normSquared [Add R] [Mul R] (value : GaussianInteger R) : R :=
  value.realPart * value.realPart +
    value.imaginaryPart * value.imaginaryPart

Predicate logic (unfolded):

  def normSquared [Add R] [Mul R] (value : GaussianInteger R) : R :=
  value.realPart * value.realPart +
    value.imaginaryPart * value.imaginaryPart (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def normSquared [Add R] [Mul R] (value : GaussianInteger R) : R :=
  value.realPart * value.realPart +
    value.imaginaryPart * value.imaginaryPart
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
def normSquared [Add R] [Mul R] (value : GaussianInteger R) : R :=
  value.realPart * value.realPart +
    value.imaginaryPart * value.imaginaryPart

end LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs
