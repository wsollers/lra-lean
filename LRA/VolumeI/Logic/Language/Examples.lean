import LRA.VolumeI.Logic.Language.Symbols.Signature

namespace LRA.VolumeI.Logic

/-!
Worked examples of `Signature`.

Two of the standard opening examples from algebra: the signature of monoids
under multiplication, and the signature of monoids under addition. Both have
the same shape -- one binary function symbol, one constant symbol, no
relation symbols -- differing only in which operation and identity element
they name. Building both side by side makes that shared shape visible, and
exercises the "no relation symbols at all" case, which nothing so far has
instantiated.

These are signature-only examples. Concrete models interpreting them (e.g.
`Nat` under multiplication, `Nat` under addition) belong with `Model`'s own
examples, once `Model` has its own `Examples.lean`.
-/

/-!
`L_Monoid = ⟨*, 1⟩`: the signature of a monoid under multiplication.
-/

/-- The one function symbol of `L_Monoid`: multiplication, arity 2. -/
inductive MonoidFunctionSymbol where
  | mul

/-- `L_Monoid` has no relation symbols. -/
def MonoidRelationSymbol : Type := Empty

/-- The one constant symbol of `L_Monoid`: the multiplicative identity. -/
inductive MonoidConstantSymbol where
  | one

def monoidFunctions : ArityIndexedSymbols where
  Symbol := MonoidFunctionSymbol
  arity
    | .mul => 2

def monoidRelations : ArityIndexedSymbols where
  Symbol := MonoidRelationSymbol
  arity := Empty.elim

/-- The signature `L_Monoid = ⟨*, 1⟩`. -/
def monoidSignature : Signature where
  Functions := monoidFunctions
  Relations := monoidRelations
  Constants := MonoidConstantSymbol

theorem monoidSignature.mulIsBinary :
    monoidSignature.IsBinaryFunctionSymbol .mul := rfl

/-!
`L_AdditiveMonoid = ⟨+, 0⟩`: the signature of a monoid under addition.

Same shape as `L_Monoid` above, entirely by design -- a monoid's signature
does not depend on which operation it names, only on there being one binary
function symbol and one constant symbol. Only the symbol names differ.
-/

/-- The one function symbol of `L_AdditiveMonoid`: addition, arity 2. -/
inductive AdditiveMonoidFunctionSymbol where
  | add

/-- `L_AdditiveMonoid` has no relation symbols. -/
def AdditiveMonoidRelationSymbol : Type := Empty

/-- The one constant symbol of `L_AdditiveMonoid`: the additive identity. -/
inductive AdditiveMonoidConstantSymbol where
  | zero

def additiveMonoidFunctions : ArityIndexedSymbols where
  Symbol := AdditiveMonoidFunctionSymbol
  arity
    | .add => 2

def additiveMonoidRelations : ArityIndexedSymbols where
  Symbol := AdditiveMonoidRelationSymbol
  arity := Empty.elim

/-- The signature `L_AdditiveMonoid = ⟨+, 0⟩`. -/
def additiveMonoidSignature : Signature where
  Functions := additiveMonoidFunctions
  Relations := additiveMonoidRelations
  Constants := AdditiveMonoidConstantSymbol

theorem additiveMonoidSignature.addIsBinary :
    additiveMonoidSignature.IsBinaryFunctionSymbol .add := rfl

/-!
`L_OrderedRing = ⟨+, *, -, 0, 1, <⟩`: the signature of an ordered ring.

The first example with all three kinds of symbol at once, and the first
with a non-uniform arity map: `+` and `*` are binary, `-` is unary. Per the
usual convention, `-` here is unary negation (`-x`), not binary subtraction
-- subtraction is expected to be introduced later as derived notation,
`x - y := x + (-y)`, the same "derive the convenient thing from the
primitive thing" discipline already used for `∧`/`∨`/`↔` and `∃` in
`Language/Notation`.
-/

/-- The function symbols of `L_OrderedRing`: addition and multiplication
(both arity 2), negation (arity 1). -/
inductive OrderedRingFunctionSymbol where
  | add
  | mul
  | neg

/-- The one relation symbol of `L_OrderedRing`: the strict order `<`,
arity 2. -/
inductive OrderedRingRelationSymbol where
  | lt

/-- The constant symbols of `L_OrderedRing`: the additive identity `0` and
the multiplicative identity `1`. -/
inductive OrderedRingConstantSymbol where
  | zero
  | one

def orderedRingFunctions : ArityIndexedSymbols where
  Symbol := OrderedRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1

def orderedRingRelations : ArityIndexedSymbols where
  Symbol := OrderedRingRelationSymbol
  arity
    | .lt => 2

/-- The signature `L_OrderedRing = ⟨+, *, -, 0, 1, <⟩`. -/
def orderedRingSignature : Signature where
  Functions := orderedRingFunctions
  Relations := orderedRingRelations
  Constants := OrderedRingConstantSymbol

theorem orderedRingSignature.addIsBinary :
    orderedRingSignature.IsBinaryFunctionSymbol .add := rfl

theorem orderedRingSignature.mulIsBinary :
    orderedRingSignature.IsBinaryFunctionSymbol .mul := rfl

theorem orderedRingSignature.negIsUnary :
    orderedRingSignature.IsUnaryFunctionSymbol .neg := rfl

theorem orderedRingSignature.ltIsBinary :
    orderedRingSignature.IsBinaryRelationSymbol .lt := rfl

end LRA.VolumeI.Logic
