# Volume II Arithmetic → Subjects: Redesign Design Doc

Status: **proposal, not yet approved**. This identifies topics and target
subject homes only. No file structure, namespace, or Lean content should be
written from this pass until the open questions in §6 are resolved and the
placements in §4 are confirmed.

## 1. Source and scope

`source.md` (this directory) attributes the existing content to "Serge Lang
— Basic Arithmetic." The user's own framing is Lang's *Basic Mathematics*
(Springer, 1971) — a precalculus text; "Arithmetic" is this repo's folder
name for its early chapters, not a distinct book. I could not independently
verify Lang's exact chapter-by-chapter table of contents this session (every
source I tried — LOC catalog, Archive.org, Amazon, Scribd, the Portal wiki —
is blocked by this environment's egress proxy; only search-result snippets
came through, confirming chapter titles "Numbers," "Linear Equations,"
"Real Numbers," "Quadratic Equations" but not a full listing). The topic
inventory below is therefore grounded in three things instead: the user's
own topic list, what already exists in `LRA/VolumeII/Arithmetic/`, and
ordinary precalculus-curriculum knowledge of what this material covers. If
exact fidelity to Lang's own chapter boundaries matters, that needs a check
against a physical or otherwise-reachable copy before §4 is finalized.

Scope, per the user: this is **pre-analysis** mathematics — the last of the
elementary-algebra/precalculus content that sits between the number-system
constructions (already migrated) and real analysis proper (limits,
continuity, differentiation — not here). That framing already answers one
placement question by itself: nothing in this pass should land in
`LRA.Analysis`, because everything here is explicitly what comes *before*
analysis, the same way `RealNumbers`' own construction files are pre-analysis
despite building the reals.

## 2. What exists today

```
LRA/VolumeII/Arithmetic/
  AlgebraicIdentities.lean     -- Square, SqAddExpanded, SqSubSqExpanded, SqSubExpanded
  Fractions.lean                -- CrossMultiplication, FractionCancellation, ...
  MultiplicativeInverses.lean   -- NonzeroHasMultiplicativeInverse, RightInverseIsInverse, ...
  Parity.lean                    -- IsEven/IsOdd (natural numbers), EvenAddEven, SqOddOfOdd, ...
  Examples.lean                  -- executable smoke tests over the above
  Model/{FirstOrderSignature,ModelBuilder,Theory,All}.lean
  source.md
```

**One file is already well-designed and needs no architectural change:**
`AlgebraicIdentities.lean` states each identity over "any carrier with the
mixin certificates it actually requires" (`CommutativeSemiringLaws R`,
`CommutativeRingLaws R`, ...) — generic, no hardcoded number system. This is
the pattern everything else here should follow, not an outlier.

**Three files have the exact problem §7.7 of `subject-architecture-prompt.md`
warns about.** `Fractions.lean`, `MultiplicativeInverses.lean`, and
`Parity.lean` each import `LRA.VolumeII.Switches.NumberSystems` — but that
switch module doesn't actually supply the carrier abbreviations these files
use; each file separately declares `abbrev Z := Int`, `abbrev Q := Rat`,
`abbrev N := Nat` directly against Mathlib, and the switch import is
unused. So the "switch consumer" design §7.7 describes as an acceptable
interim state was never actually wired up here — this is hardcoded to
Mathlib, full stop, with a decorative import suggesting otherwise. §7.7's
own words: *"`Arithmetic/` is written against whichever carrier the switch
selected. It is the natural first consumer to rewrite against interface
binders, and the test of whether the interface is adequate."* This redesign
is that rewrite — binding against `DiscretelyOrderedIntegralDomainModel`/`DenselyOrderedFieldModel`/`RealModel`
(or the underlying `IntegerAndPositiveNaturalData`-style embedding records
already used by `RationalQuotientFractions`) as explicit parameters, the
same way every migrated `NumberSystems` file already does, not against a
concrete Mathlib type.

**`MultiplicativeInverses.lean` may be near-total duplication.**
`NonzeroHasMultiplicativeInverse`, `RightInverseIsInverse`, and
`MulEqZeroImpliesZero` restate what `LRA.AlgebraicStructures`'s
`MultiplicativeInverseLaws`/`NontrivialityLaw`/field certificates already
give generically (these are exactly the certificates
`ComplexNumbers.Constructions.OrderedPairs.Instances` and every
`DenselyOrderedFieldModel`/`RealModel` already register). Worth confirming whether
this file survives the redesign as its own thing, or collapses into direct
use of the existing generic certificates at the relevant number-system
carrier.

## 3. The architectural principle carried through §4

Per §1.1 of `subject-architecture-prompt.md`: *"A subject is a durable
mathematical domain that owns declarations... Curricular volumes are
presentation order, not ownership."* Lang's chapter groupings are the
*reading order*; they are not a reason to keep this content in one place.
Each topic below is placed by what it's fundamentally **about**, generic
over an interface parameter wherever the existing migrated systems already
do that (`DenselyOrderedFieldModel`, `RealModel`, `DiscretelyOrderedIntegralDomainModel`, or a plain
`[CommutativeRingLaws R]`-style mixin the way `AlgebraicIdentities.lean`
already does it) — never hardcoded to a Mathlib concrete type, and never
routed through a "switch."

`LRA/VolumeII/Arithmetic.lean` survives only as a thin curricular
aggregator once this is done (§2.6: "Volume aggregators... own nothing"),
the same role `VolumeII.lean` already plays for the number systems.

## 4. Topic-by-topic placement

### 4.1 Numeric algebraic identities — stays, generalizes
**Home: `LRA.AlgebraicStructures`.** Already correctly designed
(§2 above). Moves essentially unchanged; only the subject location changes.
Candidate group: `AlgebraicStructures/CommutativeRing/Identities/` or
similar — exact leaf placement is a §5 (file-structure) question, not a §4
(subject) question.

### 4.2 Exponentiation and its laws — new content, home undecided
Not present today. Needs: `a^n` for `n : Nat` (repeated monoid
multiplication) at minimum; `a^(m+n) = a^m * a^n`, `(a^m)^n = a^(m*n)`,
`(a*b)^n = a^n * b^n`; later, integer exponents via a field's inverse
(`a^(-n) := (a^n)⁻¹`).
**Candidate home: `LRA.AlgebraicStructures`**, as a `Monoid`-level notion
(Mathlib puts `Monoid.npow` in exactly this spot) — reasoned over *any*
`[Mul R] [OfNat R 1]` carrier the same way `AlgebraicIdentities.lean`
reasons over `CommutativeSemiringLaws`. I looked for an existing power/
exponent concept under `LRA.AlgebraicStructures` or `LRA.Operation` first
(`LRA.Operation.Divisibility` was the only close relative) — there isn't
one yet, so this is new, not a move. **Open question in §6.1**: is
`AlgebraicStructures` right, or should this sit under `LRA.Operation`
instead (which already owns the general operation-law taxonomy —
Associative, Distributive, Idempotent, Nilpotent, ...)?

### 4.3 Polynomials — new content, home fairly clear
Not present as a general notion today. **One already exists**, but only as
a one-off: `LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
.Behavior.Polynomial` (built solely to state the algebraic-closure/FTA
obligation). **Home: `LRA.AlgebraicStructures`** — polynomials over a
commutative ring are ring-generic, not tied to any particular number
system, and belong at the same structural level as `Ring`/`Field`
themselves. Recommendation: build the general
`AlgebraicStructures.Polynomial R` here, then have
`ComplexNumbers.Constructions.OrderedPairs.Behavior` import and specialize
it instead of carrying its own copy — a cleanup opportunity, not required
for this pass to land.

### 4.4 Rational expressions (algebraic fractions of polynomials)
Not present today. **Home: `LRA.AlgebraicStructures`**, immediately
downstream of §4.3 — a rational expression is an element of the field of
fractions of a polynomial ring, the same construction shape
`RationalQuotientFractions` already uses for numeric fractions (formal
pairs modulo cross-multiplication equivalence), just instantiated at
`Polynomial R` instead of `IntegerAndPositiveNaturalData`. Likely reuses
the *pattern* (and possibly literally the same generic machinery, if
`RationalQuotientFractions` is generalized rather than reimplemented —
worth checking before building a second copy).

### 4.5 Numeric fractions (existing `Fractions.lean`)
**Home: `LRA.NumberSystems.RationalNumbers`**, rewritten against
`IntegerAndPositiveNaturalData`/`DenselyOrderedFieldModel` (the parameters
`RationalQuotientFractions` already takes) instead of Mathlib `Int`/`Rat`.
`CrossMultiplication`, `FractionCancellation`, and
`NegativeNumeratorEqualsNegativeDenominator` are arguably already *proven*
somewhere in `RationalQuotientFractions`'s own `Laws`/`Behavior` stages, or
close enough that they should cite those rather than restate them — a
duplication check belongs in the file-structure pass, not here.

### 4.6 Multiplicative inverses (existing `MultiplicativeInverses.lean`)
**Home: likely deleted, not moved** — see the duplication note in §2.
If any content survives after checking against
`LRA.AlgebraicStructures`'s existing `MultiplicativeInverseLaws`/
`NontrivialityLaw` certificates, it lands wherever those already live,
specialized at `DenselyOrderedFieldModel`.

### 4.7 Parity — integer evenness (existing `Parity.lean`)
**Home: `LRA.NumberSystems.Integers`** (or `NaturalNumbers`, whichever
carrier Lang actually states it over — the existing file uses `Nat`).
Rebuild `IsEven`/`IsOdd` on top of the already-generic
`LRA.Operation.Divides multiplication 2 value` rather than hardcoding
Mathlib's `Even`/`Odd`, reusing infrastructure that already exists and is
subject-appropriate (`Divides` is exactly "evenness," parametrized).

**Naming collision worth flagging explicitly**: this is unrelated to
even/odd *functions* (§4.8) despite the shared English word — one is a
divisibility property of a number, the other is a symmetry property of a
function (`f(-x) = f(x)` vs. `f(-x) = -f(x)`). They should never share a
namespace or a file.

### 4.8 Elementary real-valued functions (absolute value, even/odd
functions, and by extension monotonicity/boundedness of specific function
families) — **the question the user flagged**

Three candidate homes, genuinely open:

1. **`LRA.Function`** — the general subject for functions (composition,
   injective/surjective/bijective, the set-theoretic bridge). Pro:
   `IsEven`/`IsOdd` *as function properties* are arguably general enough
   (they make sense for any function `A → B` with negation on both sides,
   not only `ℝ → ℝ`). Con: `LRA.Function` today is about function
   *machinery*, not a growing catalogue of concrete named functions and
   their precalculus-level facts — absolute value specifically needs an
   ordered/normed carrier, so it can't be stated at `LRA.Function`'s level
   of generality without smuggling in real-number-specific structure
   anyway.
2. **`LRA.NumberSystems.RealNumbers`, a new group** (my recommendation) —
   sits alongside `Extended`, `NonNegative`, `Extensions`,
   `IntervalArithmetic`, `Irrationals`: all of those are exactly this
   shape already, "derived theory built atop a `real_model : RealModel`
   parameter, not a construction." Absolute value in particular is closer
   to already built than not: `NonNegative.lean`'s `NonNegativeReal
   real_model` and its `toReal` projection are most of what
   `AbsoluteValue : real_model.signature.carrier → NonNegativeReal
   real_model` needs. Even/odd functions, and other named real-valued
   function facts, would join as a sibling file in the same group.
3. **A new subject** — rejected for now per §1.1's "create a subject only
   when it owns durable declarations" and because this content isn't
   distinct enough from `RealNumbers`' existing derived-theory files to
   justify a new root; revisit only if this group grows large enough that
   `RealNumbers` itself starts to feel overloaded.

I lean toward (2), reusing what `NonNegative.lean` already built and
matching the existing derived-theory group pattern exactly, but this is
squarely the user's call to make — flagged for §6.2.

### 4.9 Equations, inequalities, systems — solution-set predicates (agreed)
Per the user's decision: `IsSolutionOf`/`SolutionSet`-style predicates over
a carrier, not just named closed-form identities (e.g. the quadratic
formula stated as a *solvability* theorem: "the solution set of
`a·x² + b·x + c = 0` equals `{roots}` when ..."). Systems are conjunctions/
intersections of solution sets — no new vocabulary needed for "system"
itself once one equation's solution set exists.

**Split home:**
- **Equations** (linear, quadratic, and polynomial in general) —
  `LRA.AlgebraicStructures`, downstream of §4.2/§4.3 (a quadratic equation
  is stated over a `Polynomial` or directly over ring operations; its
  solvability facts need the field structure).
- **Inequalities** — `LRA.Order`, since solving an inequality is fundamentally
  об an order-relation question (`a·x + b < c ↔ x < ...`, sign-dependent
  case splits), not a ring-equality one. `LRA.Order.Bounds` already exists
  as a sibling group in this subject.
- **Systems** of either — live wherever their members do; no separate
  "systems" file is needed unless the *combination* itself earns a
  standalone theorem (e.g. Cramer's-rule-style linear-system solvability),
  in which case it's `AlgebraicStructures` (systems of equations) or
  `Order` (systems of inequalities), same split.

### 4.10 Number line, intervals
**"Number line" is not itself a formalizable object distinct from "the
reals with their order"** — `RealModel` plus the existing `LRA.Order`
machinery already *is* the number line; no new type is needed for it.

**Intervals: home `LRA.Order`**, as a new group (`Order/Intervals/`) —
generic over any linearly/totally ordered carrier
(open/closed/half-open, `[a,b]`, `(a,b)`, `[a,b)`, `(a,b]`, rays), not
real-specific. `LRA.Order.Bounds` is the closest sibling already there.
**Note for later, not this pass**: `RealNumbers.Constructions
.PrimitiveIntervals` already has its own ad-hoc `RationalInterval`
construction-internal notion of an interval, built before this generic
one would exist. Once `Order.Intervals` exists, that construction is a
candidate to restate in terms of it rather than keep its private
copy — flagged, not required now.

## 5. What this design doc deliberately does not do

No file paths inside each target subject, no namespace names, no Lean
code, no decision about which files get split into `Definition`/
`Theorems`/`Characterizations` per §2.3's file-role rules. That is the next
pass, once §6 is answered.

## 6. Open questions for sign-off

1. **Exponentiation's home**: `LRA.AlgebraicStructures` (my lean) or
   `LRA.Operation`?
2. **Elementary real-valued functions' home** (absolute value, even/odd
   functions, and future siblings): `LRA.Function`, a new
   `RealNumbers/Functions`-style group (my lean), or held open pending
   seeing how large this group actually grows?
3. **Fidelity to Lang's actual table of contents**: worth pinning down
   precisely (via a copy of the book) before finalizing §4's grouping, or
   is the topic list as given (plus ordinary precalculus scope) good
   enough to proceed on?
4. **Duplication cleanups flagged above** (§4.3's `ComplexNumbers`
   `Polynomial`, §4.5's possible overlap with `RationalQuotientFractions`,
   §4.6's likely-redundant `MultiplicativeInverses.lean`) — resolve as part
   of this redesign, or file as follow-ups and keep this pass additive-only?

## 7. Discussion notes (recorded, not yet resolved)

Per the user's explicit instruction, these are recorded for later
discussion — nothing below has been acted on, and §4 above is left
unchanged so the original proposal stays visible next to the pushback.

**A recurring pattern across all of this feedback**: a two-tier split,
generic law in an algebra-flavored subject + a *concrete realization*
instantiated at the actual constructed number systems in
`NumberSystems/Arithmetic`. This is a sharper version of §4's placements
than the design doc first drew — several of §4's "home: AlgebraicStructures"
calls implicitly assumed the generic law was the whole story; the user's
model keeps `NumberSystems/Arithmetic` alive as a real, non-thin location
(concrete instantiations), not just a curricular aggregator as §3 assumed.

**Intervals (§4.10) — pushback on the `LRA.Order` placement.** User's
view: intervals belong in `NumberSystems`, as something like a "space"
(possibly Euclidean space, possibly its own "Intervals" notion) — ordered
lattices of a type, or of types embedded in a type (i.e. genuinely
tied to the number-system embedding chain, not abstract-order-generic).
Intervals are *sets*, so they carry the `LRA.Set` operations for free
(membership, union, intersection, ...) the same way any other constructed
set-of-something does elsewhere in this migration. Also wants: open/closed
endpoints, length, distance — i.e. more than the pure order-theoretic
content §4.10 proposed; length/distance reach toward metric structure.
Not yet decided where exactly ("space," "Euclidean space," "Intervals" all
floated) — needs its own follow-up discussion, possibly touching how far
into metric/analysis-adjacent territory this should reach before it
becomes `LRA.Analysis`'s job instead.

**Elementary real-valued functions (§4.8) — resolved differently than my
lean.** User's call: specific functions (absolute value, even/odd
functions, and by extension this whole family) go into **`LRA.Analysis`**,
not `LRA.Function` and not a new `RealNumbers/Functions` group. This
overrides §1's blanket "nothing here is Analysis, everything is
pre-analysis" framing — the user's model apparently treats "the study of
named real-valued functions" as `Analysis`'s job specifically, distinct
from the pre-analysis number-system constructions themselves. Worth
reconciling explicitly with §1's framing in the next pass (is *all* of
Analysis off-limits except this one family, or does this mean the
pre-analysis/analysis boundary should be redrawn generally?).

**Fractions, exponentiation, and similar (§4.2, §4.5) — confirmed as
two-tier.** Generic algebraic structure stays generic (§4.2's
`AlgebraicStructures` lean for exponentiation stands); the *concrete
realizations* at the actual number-system carriers belong in
`NumberSystems/Arithmetic` as a real, populated location — not folded
away or left as a thin aggregator per §3's original framing.

**Polynomials, polynomial fractions (§4.3, §4.4) — same two-tier pattern,
subject name uncertain.** User: these belong in "Algebra," floating the
possibility of "pushing `AlgebraicStructures` down" (i.e. `AlgebraicStructures`
itself might need to become, or sit inside, a broader `Algebra` subject,
or a new subject appears alongside it) — explicitly unresolved ("not
sure"). Concrete realizations again go in `NumberSystems/Arithmetic`.
This needs a decision on whether `LRA.AlgebraicStructures` (already a
subject-list entry, §1.1) *is* "Algebra," or whether a distinct `LRA.Algebra`
subject is being proposed on top of it — a structural question with
knock-on effects for §4.2's exponentiation placement too, since that was
also aimed at `AlgebraicStructures`.

**Equations and inequalities (§4.9) — still open on the user's side.**
Assistant's opinion, offered for the later discussion, not a decision:
apply the same two-tier split symmetrically to *both* equations and
inequalities, and place the generic solvability theory for both in
Algebra/`AlgebraicStructures` rather than splitting inequalities off to
`LRA.Order` as §4.9 first proposed. Reasoning: "solve this inequality" is
not abstract order theory (posets, lattices, bounds) — it is specifically
about how an order interacts with ring/field operations, which is what
`OrderedField`/`OrderedRing`/`LinearlyOrderedRing` already encode as
concrete structures under `AlgebraicStructures`
(`AdditionRespectsOrderLaws`, `MultiplicationRespectsOrderLaws`, ...).
Equation-solving is the same story one level down, with no order
involved at all. This mirrors the user's own reasoning against the
`Order` placement for intervals: arithmetic-flavored content stays closer
to Algebra/NumberSystems than to abstract Order, even when an order
relation is involved. Systems of either stay wherever their members do —
no separate "systems" subject or group needed.
