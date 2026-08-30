# Landau Crosswalk — Theorem ↔ Lean Declaration

Maps each theorem in [`LANDAU-THEOREMS.md`](LANDAU-THEOREMS.md) to the Lean declaration(s) that formalize it, with exact file path and declaration name. Companion to [`docs/foundations/16-landau-cert-naming-history.md`](docs/foundations/16-landau-cert-naming-history.md) — once the generic transport-theorem / cert-naming approach lands, entries here should get re-pointed at `Cert_*`/`StructCert_*` names instead of the raw `Landau*` declarations, and this file's job shifts to tracking *that*.

**Scope note:** covers Chapter I (Natural Numbers) only for now, per current focus. Axioms are intentionally excluded — see `LANDAU-THEOREMS.md`.

**Reading the Status column:** `proved` = compiles with no `sorry`; `sorry` = declared but unproven; `—` = no corresponding Lean declaration found (checked `LRA/NumberSystems/NaturalNumbers/**`, `LRA/NumberSystems/PeanoSystem/**`, `LRA/Operation/**`; not forced to a weak match).

## Chapter I — Natural Numbers

| # | Statement | Lean declaration | Status |
|---|---|---|---|
| Theorem 1 | If x = y then x' = y' | — (trivial via `congrArg`, no dedicated lemma) | n/a |
| Theorem 2 | x' ≠ x for every natural number x | `LRA/NumberSystems/PeanoSystem/Theorems/Successor.lean:NoObjectIsItsOwnSuccessor` (generic, applies via `LandauPeanoSystem`) | sorry |
| Theorem 3 | If x ≠ 1 then x is the successor of some u | `LRA/NumberSystems/PeanoSystem/Theorems/Predecessor.lean:NonOneElementsHaveAPredecessor` (generic; see also `PredecessorExistsUniqueAwayFromOne` for the existence+uniqueness form) | sorry |
| Theorem 4 (and Definition 1) | Addition x+y exists, uniquely defined by x+1=x', x+y'=(x+y)' | `LRA/NumberSystems/NaturalNumbers/Constructions/Landau/Operations/Addition.lean:LandauAdditionClauses`, `:LandauAdditionWellDefined`, `:LandauAdditionWithOne`, `:LandauAdditionSuccessorOnRight` | sorry (all four) |
| Theorem 5 (Associative Law of Addition) | (x+y)+z = x+(y+z) | `LRA/NumberSystems/NaturalNumbers/Constructions/Landau/Operations/Addition.lean:LandauAdditionIsAssociative`; bundled by `Builders.lean:LandauAdditiveSemigroupLawsOn` | sorry |
| Theorem 6 (Commutative Law of Addition) | x+y = y+x | `LRA/NumberSystems/NaturalNumbers/Constructions/Landau/Operations/Addition.lean:LandauAdditionIsCommutative`; bundled by `Builders.lean:LandauAdditiveCommutativeLawsOn` | sorry |
| Theorem 7 | y + x ≠ x for all x, y | — | — |
| Theorem 8 | If y ≠ z then x+y ≠ x+z (cancellation) | — (generic `LRA/Operation/Laws/Cancellation/*` framework exists but is not instantiated against `LandauAddition`) | — |
| Theorem 9 | For given x,y exactly one holds: x=y, x=y+u, or y=x+v | — (underlies the `LandauLessThan` definition itself; no separate trichotomy-of-cases lemma at this exact statement) | — |
| Theorem 10 | Trichotomy: for any x,y exactly one of x=y, x>y, x<y holds | `LRA/NumberSystems/NaturalNumbers/Constructions/Landau/Laws.lean:LandauLessThanTrichotomous` | sorry |
| Theorem 11 | If x>y then y<x | — | — |
| Theorem 12 | If x<y then y>x | — | — |
| Theorem 13 | If x=y then y≤x | — | — |
| Theorem 14 | If x=y then y≥x | — | — |
| Theorem 15 (Transitivity of Ordering) | If x<y and y<z then x<z | `LRA/NumberSystems/NaturalNumbers/Constructions/Landau/Laws.lean:LandauLessThanTransitive` | sorry |
| Theorem 16 | Mixed strict/non-strict transitivity of < gives x<z | — | — |
| Theorem 17 | If x≤y and y≤z then x≤z | — | — |
| Theorem 18 | x+y > x | — | — |
| Theorem 19 | Order of x,y determines order of x+z,y+z (addition preserves order) | `LRA/NumberSystems/NaturalNumbers/Constructions/Landau/Laws.lean:LandauAdditionPreservesAndReflectsLandauLessThan` (→ direction) | sorry |
| Theorem 20 | Converse of Theorem 19: order of sums determines order of x,y | `LRA/NumberSystems/NaturalNumbers/Constructions/Landau/Laws.lean:LandauAdditionPreservesAndReflectsLandauLessThan` (← direction; same `Iff` lemma as Theorem 19) | sorry |
| Theorem 21 | If x>y and z>u then x+z > y+u | — | — |
| Theorem 22 | Mixed strict/non-strict version of Theorem 21 | — | — |
| Theorem 23 | If x≥y and z≥u then x+z ≥ y+u | — | — |
| Theorem 24 | x ≥ 1 for every natural number x | — | — |
| Theorem 25 | If y>x then y ≥ x+1 | — | — |
| Theorem 26 | If y < x+1 then y ≤ x | — | — |
| Theorem 27 (Well-Ordering) | Every non-empty set of natural numbers has a least element | `LRA/NumberSystems/WholeNumbers/Constructions/Landau/Laws.lean:well_ordering` — **wrong namespace**: lives under `WholeNumbers`, not `NaturalNumbers` | sorry |
| Theorem 28 (and Definition 6) | Multiplication xy exists, uniquely defined by x·1=x, xy'=xy+x | `LRA/NumberSystems/NaturalNumbers/Constructions/Landau/Operations/Multiplication.lean:LandauMultiplicationClauses`, `:LandauMultiplicationWellDefined`, `:LandauMultiplicationWithOne`, `:LandauMultiplicationSuccessorOnRight` | sorry (all four) |
| Theorem 29 (Commutative Law of Multiplication) | xy = yx | `LRA/NumberSystems/NaturalNumbers/Constructions/Landau/Operations/Multiplication.lean:LandauMultiplicationIsCommutative`; bundled by `Builders.lean:LandauMultiplicativeCommutativeLawsOn` | sorry |
| Theorem 30 (Distributive Law) | x(y+z) = xy+xz | `LRA/NumberSystems/NaturalNumbers/Constructions/Landau/Operations/Multiplication.lean:LandauMultiplicationDistributesOverAddition`, `:LandauLeftDistributivityOfMultiplicationOverAddition`, `:LandauMultiplicationDistributesOverAdditionBothSides` | sorry (all three) |
| Theorem 31 (Associative Law of Multiplication) | (xy)z = x(yz) | `LRA/NumberSystems/NaturalNumbers/Constructions/Landau/Operations/Multiplication.lean:LandauMultiplicationIsAssociative`; bundled by `Builders.lean:LandauMultiplicativeSemigroupLawsOn` | sorry |
| Theorem 32 | Order of x,y determines order of xz,yz (multiplication preserves order) | `LRA/NumberSystems/NaturalNumbers/Constructions/Landau/Laws.lean:LandauMultiplicationPreservesAndReflectsLandauLessThan` (→ direction) | sorry |
| Theorem 33 | Converse of Theorem 32: order of products determines order of x,y | `LRA/NumberSystems/NaturalNumbers/Constructions/Landau/Laws.lean:LandauMultiplicationPreservesAndReflectsLandauLessThan` (← direction; same `Iff` lemma as Theorem 32) | sorry |
| Theorem 34 | If x>y and z>u then xz > yu | — | — |
| Theorem 35 | Mixed strict/non-strict version of Theorem 34 | — | — |
| Theorem 36 | If x≥y and z≥u then xz ≥ yu | — | — |

## Summary (Chapter I)

- 21 of 36 theorems have at least one matching Lean declaration; every one of those is currently `sorry` (unproven) — none of Chapter I is actually complete yet, only stated.
- 15 theorems (7, 8, 9, 11–14, 16–18, 21–26, 34–36) have no corresponding declaration anywhere searched. Most are order-arithmetic corollaries of Theorems 10/15/19/20/32/33 and are plausible one-line consequences once those are proved — but nothing currently states them.
- Theorem 27 (Well-Ordering) is misplaced: it's declared under `WholeNumbers`, not `NaturalNumbers`, where the book states it.
- Not yet extended to Chapters II–V (Fractions, Cuts, Real Numbers, Complex Numbers) — see `LANDAU-THEOREMS.md` for the full numbering; add those sections here when that scope is picked up.
