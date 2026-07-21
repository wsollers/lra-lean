import Mathlib.Data.Rat.Defs
import Mathlib.Data.Real.Basic
import Mathlib.Data.Int.Cast.Lemmas
import Mathlib.Algebra.Order.Ring.Cast
import Mathlib.Data.Rat.Cast.Order
import LRA.VolumeI.Logic.Model.Examples
import LRA.VolumeI.Logic.Model.Comparison.ModelEmbedding
import LRA.VolumeI.Logic.Model.Comparison.ModelIsomorphism
import LRA.VolumeI.Logic.Model.Comparison.Automorphism

namespace LRA.VolumeI.Logic

/-!
Worked examples of `Model.Comparison`.

`Q` and `R` as models of `L_OrderedRing` (built from Mathlib's `Rat` and
`Real`, alongside `intOrderedRingModel` from `Model.Examples`), and the
`Z ↪ Q ↪ R` embedding chain relating them via `ModelEmbedding`.

`Z`, `Q`, `R` here are Mathlib's `Int`/`Rat`/`Real`, chosen specifically to
exercise `ModelEmbedding` against already-trusted number types before any
of the from-scratch LRA number-systems constructions exist as Lean code.

Pitfalls met while writing this file, worth naming alongside the ones
already recorded in `Model.Examples`:

1. `toFun` must be annotated with its concrete source and target type
   (`(Int.cast : Int -> Rat)`, not bare `Int.cast`) -- `ModelEmbedding`'s
   field type mentions `M₁.Domain -> M₂.Domain`, a pair of opaque
   projections, and Lean will not unfold them to discover `Int`/`Rat` and
   find `IntCast`/`RatCast` instances on its own.

2. Bare `simp` (no arguments) cannot unfold `interpretFunction`/
   `interpretConstant`/`interpretRelation` on a concrete model, because
   those definitions are not `@[simp]`-tagged. The model's own name must be
   supplied to `simp` as an unfolding lemma (`simp [intOrderedRingModel]`)
   for it to make any progress at all -- omitting it produces "simp made
   no progress", not success.

3. `Int.cast_injective`/`Rat.cast_injective` are stated for a generic
   target type with a `CharZero`/`DivisionRing` instance, and Lean cannot
   always unify that generic statement against the specific instance path
   (`Rat.instIntCast`, `Real.instRatCast`) `ModelEmbedding`'s field expects
   without being told explicitly which type to instantiate at.
-/

/-!
`Q` and `R` as models of `L_OrderedRing`.
-/

/-- `Rat` under the usual ring operations and strict order, interpreting
`L_OrderedRing`. -/
def qOrderedRingModel : Model orderedRingSignature where
  Domain := Rat
  domainNonempty := ⟨0⟩
  interpretFunction
    | .add, args => args ⟨0, by decide⟩ + args ⟨1, by decide⟩
    | .mul, args => args ⟨0, by decide⟩ * args ⟨1, by decide⟩
    | .neg, args => -(args ⟨0, by decide⟩)
  interpretRelation
    | .lt, args => args ⟨0, by decide⟩ < args ⟨1, by decide⟩
  interpretConstant
    | .zero => 0
    | .one => 1

theorem qOrderedRingModel.addComputesAddition
    (a b : Rat) :
    qOrderedRingModel.interpretFunction .add
      (fun i => if i.val = 0 then a else b) = a + b := rfl

theorem qOrderedRingModel.zeroComputesZero :
    qOrderedRingModel.interpretConstant .zero = (0 : Rat) := rfl

theorem qOrderedRingModel.oneComputesOne :
    qOrderedRingModel.interpretConstant .one = (1 : Rat) := rfl

/-- `Real` under the usual ring operations and strict order, interpreting
`L_OrderedRing`. -/
def rOrderedRingModel : Model orderedRingSignature where
  Domain := Real
  domainNonempty := ⟨0⟩
  interpretFunction
    | .add, args => args ⟨0, by decide⟩ + args ⟨1, by decide⟩
    | .mul, args => args ⟨0, by decide⟩ * args ⟨1, by decide⟩
    | .neg, args => -(args ⟨0, by decide⟩)
  interpretRelation
    | .lt, args => args ⟨0, by decide⟩ < args ⟨1, by decide⟩
  interpretConstant
    | .zero => 0
    | .one => 1

theorem rOrderedRingModel.addComputesAddition
    (a b : Real) :
    rOrderedRingModel.interpretFunction .add
      (fun i => if i.val = 0 then a else b) = a + b := rfl

theorem rOrderedRingModel.zeroComputesZero :
    rOrderedRingModel.interpretConstant .zero = (0 : Real) := rfl

theorem rOrderedRingModel.oneComputesOne :
    rOrderedRingModel.interpretConstant .one = (1 : Real) := rfl

/-!
The embedding chain `Z ↪ Q ↪ R` as `ModelEmbedding`s of `L_OrderedRing`.

Each embedding uses Mathlib's own cast map (`Int.cast`, `Rat.cast`) as the
underlying domain function, and Mathlib's own cast lemmas
(`Int.cast_injective`, `Int.cast_add`, `Int.cast_mul`, `Int.cast_lt`, and
their `Rat.cast` analogues) to discharge injectivity and atomic
preservation, rather than reproving facts about these casts from scratch.
-/

/-- The embedding of `Z` into `Q`, as models of `L_OrderedRing`: `Int.cast`,
which is injective and preserves `add`, `mul`, `neg`, `zero`, `one`, and
`<`. -/
def zToQEmbedding : ModelEmbedding intOrderedRingModel qOrderedRingModel where
  toFun := (Int.cast : Int -> Rat)
  injective := (Int.cast_injective : Function.Injective (Int.cast : Int -> Rat))
  preservesFunction
    | .add, args => by simp [intOrderedRingModel, qOrderedRingModel]
    | .mul, args => by simp [intOrderedRingModel, qOrderedRingModel]
    | .neg, args => by simp [intOrderedRingModel, qOrderedRingModel]
  preservesConstant
    | .zero => by simp [intOrderedRingModel, qOrderedRingModel]
    | .one => by simp [intOrderedRingModel, qOrderedRingModel]
  preservesRelation
    | .lt, args => by simp [intOrderedRingModel, qOrderedRingModel, Int.cast_lt]

/-- The embedding of `Q` into `R`, as models of `L_OrderedRing`: `Rat.cast`,
which is injective and preserves `add`, `mul`, `neg`, `zero`, `one`, and
`<`. -/
def qToREmbedding : ModelEmbedding qOrderedRingModel rOrderedRingModel where
  toFun := (Rat.cast : Rat -> Real)
  injective := (Rat.cast_injective : Function.Injective (Rat.cast : Rat -> Real))
  preservesFunction
    | .add, args => by simp [qOrderedRingModel, rOrderedRingModel]
    | .mul, args => by simp [qOrderedRingModel, rOrderedRingModel]
    | .neg, args => by simp [qOrderedRingModel, rOrderedRingModel]
  preservesConstant
    | .zero => by simp [qOrderedRingModel, rOrderedRingModel]
    | .one => by simp [qOrderedRingModel, rOrderedRingModel]
  preservesRelation
    | .lt, args => by simp [qOrderedRingModel, rOrderedRingModel, Rat.cast_lt]

/-!
`Q` is isomorphic, and automorphic, to itself.

Unlike `zToQEmbedding`/`qToREmbedding` (genuine embeddings that are not
isomorphisms -- `Int.cast : Int -> Rat` is injective but not surjective,
since e.g. no integer casts to `1/2`), the identity map on `qOrderedRingModel`
is both a `ModelIsomorphism` (`Q ≅ Q`) and, being an isomorphism from a
model to itself, an `Automorphism`. This is `Automorphism.identity`,
generic over any signature and model, specialized to `qOrderedRingModel` --
included here to exercise the generic construction against a concrete
model rather than leave it checked only in the abstract.
-/

/-- The identity map on `qOrderedRingModel` is a model isomorphism of `Q`
with itself. -/
def qToQIsomorphism : ModelIsomorphism qOrderedRingModel qOrderedRingModel :=
  Automorphism.identity qOrderedRingModel

/-- The identity map on `qOrderedRingModel` is an automorphism of `Q`. -/
def qToQAutomorphism : Automorphism qOrderedRingModel :=
  Automorphism.identity qOrderedRingModel

theorem qToQIsomorphism.toFunIsIdentity :
    qToQIsomorphism.toFun = (id : Rat -> Rat) := rfl

end LRA.VolumeI.Logic
