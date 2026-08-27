# Standing decisions

Made once here so they don't get re-litigated per subject. If one turns out
wrong, fix it here first, then propagate. Several of these are inherited
verbatim from `docs/algebraic-structures-repair/DECISIONS.md` (marked
**Inherited**) — read that file too; this one only states the deltas and
the Relation/Order-specific calls.

## R1 — Reorg shape (per subject) — **Inherited (= D3), with one extension**

```
<X>.lean                      barrel -> imports Interface.lean (+ Constructions.lean
                                once it exists for this subject)
<X>/Interface.lean            barrel
<X>/Interface/
  Definitions/                 signature-level content
  ModelTheory/                 add only when this subject's item is scoped to add it
    LStructure.lean, Theory.lean, Model.lean   -- exact names, validator-enforced
  UniversalAlgebra/             add only when scoped (Lattice family)
    Signature/Definition.lean   -- exact name, validator-enforced whenever this dir exists
  Laws/                        the real <X>Laws class + atomic mixins
<X>/Constructions.lean          barrel
<X>/Constructions/
  Mathlib/                      satisfaction instances from Mathlib typeclasses
  Set/                           built from LRA.Set.Interop's providers (see R2) —
                                  for `Relation` specifically, this is the real
                                  set-of-pairs construction, not the ambient-`LRA_Set`
                                  shortcut (see README's "pushes past" note)
```

Empty stub files get deleted, not carried forward. `Examples/` and
`Failures/` are folders (one file per example), each with a barrel, same as
D3. `scripts/validate_structure.py` enforces the `ModelTheory`/
`UniversalAlgebra` internal shape and the Mathlib-import quarantine on
`Interface/Laws/*` leaves — same tool, same rules, already confirmed
passing (trivially, since neither dir exists yet) as of this coordinator's
creation.

## R2 — Reuse the existing Set Switch/Providers infrastructure, don't rebuild it

`LRA.Set.Interop.Switch.LRA_Set := _root_.Set` (Mathlib's `Set`, the
ambient default) and `LRA.Set.Interop.Providers.{LRA,Mathlib}.{ZFC,NBG,TG,
Predicate}` (named per-construction aliases, e.g.
`LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet`) already exist — added during the
`AlgebraicStructures` repair (as-01/"Generic Providers"). Do not propose or
build a parallel `CanonicalSet`-style single alias; an earlier draft of this
plan did, before this infrastructure was discovered mid-conversation — that
draft is superseded, don't resurrect it. Where a subject's Set-based
construction needs a specific named backing (ZFC, TG, NBG, ...), reference
the provider directly (`LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet`); where it
genuinely doesn't care which one, stay generic over
`[Membership Element SetObject]` (or whatever the minimal typeclass
requirement actually is) rather than hard-coding any single provider.

## R3 — `or-01` (Relation) is the one item that goes beyond D-inherited convention

See README's "pushes past" section. Every other item after `or-01` follows
the ambient/lightweight convention *unless* it specifically needs
`Relation`'s object-language relation (which `Poset`/`Lattice`/etc. all do,
by the "a poset is a set with a relation, and the relation is a set"
argument) — in which case it depends on `or-01` and uses its
`SetRelation`, not a bespoke re-derivation.

## R4 — `Ax_WellOrdered` naming — **explicit, deliberate exception, do not "fix"**

The well-ordering axiom (attaches at `or-08`, `WellOrder`) is named
`Ax_WellOrdered` verbatim, breaking this repo's PascalCase-only convention
for LRA-authored declarations. This was a direct, considered instruction
from the user, confirmed after the naming conflict was raised explicitly.
Every other new declaration in this effort follows normal PascalCase.

## R5 — Theorems are the user's to prove — **Inherited (= D8), no exceptions, stated again because it bites**

Every new `theorem`/`instance`-of-a-`Prop`-class anywhere in this tree —
`Interface/Laws`, `Constructions/*` (`Mathlib` bridges, `Set`-based
builders, order-theoretic constructions), `Examples/*`, `Failures/*` — gets
a `sorry` body, with NO exceptions for "obvious" bridges or structural
glue. This bit the `AlgebraicStructures` effort twice (see D8's own text)
before the rule was stated this plainly; don't repeat that here. The only
content written in full is *data*: relation/carrier/structure/operation
definitions, `Signature`/`LStructure` records — anything not `Prop`-valued.

## R6 — Nonemptiness, if it comes up — **Inherited (= D7)**

If any `<X>Laws` class in this tree needs a carrier-nonemptiness condition,
it's `[Nonempty R]`, an ambient instance-implicit parameter, never a stored
field (stored fields of the same name collide the moment two such classes
combine via a later `class abbrev`/extension). Not yet known to apply to
any specific `Order`/`Relation` subject — check when it comes up, don't
assume it doesn't.

## R7 — `Order/Constructions/` naming collision — resolve before `or-01` blocks on it

`LRA/Order/Constructions/{LexicographicOrder,ProductOrder,
StrictNonStrictCorrespondence}` already exists but means *order
combinators* (build a new order from two existing ones), not "concrete
implementation satisfying the generic theory" — the meaning R1's
`Constructions/` folder needs. Rename to `LRA/Order/Interface/Combinators/`
before any `Order` subject's own `Constructions/` gets created, to avoid
the collision. This is item `Combinators` in the ledger — mechanical, no
math dependency, can run in parallel with `or-01`.

## R8 — Where satellite content (Bounds, Morphisms, Directedness, Order's own Relation/) goes

Not their own `ModelTheory`-bearing subject — definable formulas riding on
a parent component's language, or properties of maps between two models of
the same theory. Each attaches to (imports, doesn't duplicate) whichever
core component owns its language, once that component exists. Don't start
these before at least one of `Poset`/`Lattice` is `done` — there's nothing
to attach to yet.

## R9 — Universal algebra: `LRA.UniversalAlgebra`, not `LRA.Identity`'s copy

`LRA/UniversalAlgebra/*` is the mature, full framework (Signature/Algebra/
Satisfaction/Congruence/Homomorphism/Isomorphism/Subalgebra/Product/
Quotient). `LRA.Identity.Interface.UniversalAlgebra` is the smaller module
`LRA/Set`'s own migration used and is the wrong fit here. `Lattice`'s
`UniversalAlgebra/Signature/Definition.lean` (`or-13`) wires into
`LRA.UniversalAlgebra`, not `LRA.Identity`'s.

## R10 — Check for pre-existing content before building anything new

Confirmed once already (as-12/`Lattice`, in the sibling coordinator): the
algebra↔order equivalence for lattices already exists, more completely than
expected, at `LRA/Order/Interop/AlgebraicLattice.lean` (moves to
`Order/Constructions/AlgebraicStructures/` per R1, not duplicated). Before
building any subject's `Constructions/`/`ModelTheory` content from scratch,
grep for existing content under `LRA/Order/Interop/`, `LRA/AlgebraicStructures/`,
and `LRA/UniversalAlgebra/` first — this tree has a real history of things
already existing under an unexpected name.

## R11 — Every axiomatic-set provider must register its own `HasPairing` instance

Every axiomatic-set `Set` provider must register its own
`instance (priority := high) : HasPairing <Carrier> <Carrier> <Carrier>`
using that provider's real pairing construction, so generic `OrderedPair`
does not silently fall back to `Prod`. Predicate-backed providers
(`LRA.Predicate`, `Mathlib.Predicate`) are the documented exception: they
have no same-carrier pairing object (elements and collections are different
types by construction, so `Prod` on the element type is the *correct*
representation, not a fallback needing an excuse — see the "predicate sets
don't need a self-encoded pair" discussion in this coordinator's originating
conversation), and intentionally rely on the generic instance, as noted in
`LRA/Set/Interop/Providers/LRA/Predicate.lean` and
`LRA/Set/Interop/Providers/Mathlib/Predicate.lean`.

Fixed 2026-08-27: `NBGSet` was missing its own `HasPairing` instance despite
already having a real native pair (`LRA.Set.Constructions.NBG.OrderedPair`)
— generic code building a relation over `NBGSet` was silently getting
Mathlib's `Prod` instead. `LRA/Set/Constructions/NBGSet/Instances.lean` now
registers `instance (priority := high) : HasPairing Set Set Set :=
⟨OrderedPair⟩`. All four axiomatic-set providers (ZFC, TG, NBG, Mathlib ZF)
now have their own instance; verify this stays true whenever a new provider
is added.
