# LRA.NumberSystems.GaussianIntegers — Proof Order

Ledger notation: see [`LRA/ProofOrderNotation.md`](../../ProofOrderNotation.md).

## Narrative order

Exactly one construction, `OrderedPairs` — the same classical ordered-pair
shape as `ComplexNumbers.Constructions.OrderedPairs`, but over a
*commutative-ring* carrier `R` rather than a field (Gaussian integers are a
ring, not a field: no `Inv` instance, no norm-nonvanishing obligation, no
algebraic-closure theorem). No rival axiomatization is expected, mirroring
`ComplexNumbers`.

Moved from `LRA.VolumeII.GaussianIntegers.Construction.Model` (a single
400-line file that mixed the construction with its "active" instantiation
and first-order model). This migration split the two, so the sibling
systems end up with the same shape: the construction lives in
`Constructions/OrderedPairs/*` (`Carrier`, `Equivalence`, `Operations`,
`WellDefinedness`, `Laws`, `Behavior`, `Instances`, `WellFoundedness`); the
active instantiation (`ActiveGaussianInteger`, `gaussianArithmeticRingModel`,
`GaussianArithmeticRingModel`) lives in `Construction.lean` /
`Construction/Model.lean`, matching where Complex's analogous (but
switch-free) `complexNumbersModel` lives. `Construction/Model.lean` still
sits downstream of Integer's active-carrier switch
(`LRA.NumberSystems.Integers.Z`) — unchanged by this move, since retiring
that switch is Integer's own concern, not Gaussian Integers'.

The full ring-law surface is one file, `Constructions/OrderedPairs/Laws.lean`
— every proof obligation this construction owns. Every other file under
`OrderedPairs/` (`Carrier`, `Equivalence`, `WellFoundedness`, `Operations`,
`WellDefinedness`, `Behavior`, `Instances`) is definitions, instances, and
smoke tests with no theorem/lemma declarations of its own: no
coordinatewise-equality `ext` lemma exists for `GaussianInteger` (unlike
`ComplexNumbers`, not added here — inventing one would be new content, not
something the source called for), and no `Inv` instance means no
norm-nonvanishing or algebraic-closure obligation analogous to Complex's.

## Per-theorem ledger

Status determined by direct inspection: every theorem below has a proof
body that is the single tactic `sorry` with no intermediate lemmas, so a
textual read and an axiom-closure check (`#print axioms`) agree exactly.
Re-derive via `scripts/GenerateProofOrderManifest.lean` once a Lean
toolchain is available, rather than trusting this by-eye pass for any
future edit to this subject.

Context shared by every entry: let `R` be a type with `CommutativeRingLaws(R)`.

### `Constructions/OrderedPairs/Laws.lean`

#### addition_is_associative

∀ a b c : GaussianInteger(R), (a + b) + c = a + (b + c)

**Status: PENDING**

#### addition_is_commutative

∀ a b : GaussianInteger(R), a + b = b + a

**Status: PENDING**

#### zero_add_gaussian

∀ a : GaussianInteger(R), 0 + a = a

**Status: PENDING**

#### add_zero_gaussian

∀ a : GaussianInteger(R), a + 0 = a

**Status: PENDING**

#### neg_add_cancel_gaussian

∀ a : GaussianInteger(R), -a + a = 0

**Status: PENDING**

#### add_neg_cancel_gaussian

∀ a : GaussianInteger(R), a + -a = 0

**Status: PENDING**

#### multiplication_is_associative

∀ a b c : GaussianInteger(R), (a * b) * c = a * (b * c)

**Status: PENDING**

#### multiplication_is_commutative

∀ a b : GaussianInteger(R), a * b = b * a

**Status: PENDING**

#### one_mul_gaussian

∀ a : GaussianInteger(R), 1 * a = a

**Status: PENDING**

#### mul_one_gaussian

∀ a : GaussianInteger(R), a * 1 = a

**Status: PENDING**

#### zero_mul_gaussian

∀ a : GaussianInteger(R), 0 * a = 0

**Status: PENDING**

#### mul_zero_gaussian

∀ a : GaussianInteger(R), a * 0 = 0

**Status: PENDING**

#### left_distributive_gaussian

∀ a b c : GaussianInteger(R), a * (b + c) = a * b + a * c

**Status: PENDING**

#### right_distributive_gaussian

∀ a b c : GaussianInteger(R), (a + b) * c = a * c + b * c

**Status: PENDING**

#### imaginary_unit_squared

imaginaryUnit * imaginaryUnit = -(1 : GaussianInteger(R))

**Status: PENDING**
