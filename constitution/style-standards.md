# Style Standards
## lra-lean — Lean 4 Formatting and Naming Rules

---

## 1. Namespace

Source-facing volume modules live under the corresponding `LRA.Volume*`
namespace hierarchy. Keep chapter and section namespaces aligned with the
file path so a VS Code user can locate declarations from their qualified names.

Legacy Landau arithmetic files may still use `namespace Landau`. In those files,
do not use dot notation on `N` (for example, do not write `N.add_comm`); cite
theorems as `Landau.add_comm`.

---

## 2. Naming Convention

### Definitions
Use source-facing PascalCase names for chapter statements, structures, and
definition/theorem packages:

```
TopologyDefinition
ClosedSetFamilyOfTopology
RealHilbertSpaceDefinition
```

Use `snake_case` only for legacy Landau arithmetic declarations and local
helper operations whose surrounding file already follows that convention:
`plus`, `mul`, `exp`, `is_odd`, `is_even`.

### Theorems
Use source-facing PascalCase names for theorem statements that correspond to
book definitions, propositions, lemmas, theorems, and corollaries.

Legacy Landau arithmetic theorems keep `snake_case` verb phrases from the
conclusion:

```
add_comm          -- plus x y = plus y x
add_assoc         -- plus (plus x y) z = plus x (plus y z)
add_cancel        -- plus x y = plus x z → y = z
succ_injective    -- successor x = successor y → x = y
one_not_succ      -- successor x ≠ one
iterator_unique   -- any two solutions to iterator clauses are equal
```

Do NOT name from the proof method:
- Bad: `induction_step`, `helper1`, `addition_lemma`
- Good: `add_ne_self`, `succ_ne_self`, `plus_base`

### Variables
- Elements of N: `m n k x y z`
- Functions N → N: `f g h`
- Target type: `W`
- Initial value: `c`
- Step rule: `g` (rename locally if conflicts with function variable)
- Predicates: `P Q`

---

## 3. Doc-Comment Requirement

Every source-facing `theorem`, `lemma`, `corollary`, `def`, `structure`,
`class`, and `axiom` must have a doc-comment with a display name and a
mathematical statement that can be read in VS Code without consulting the
source notes.

```lean4
/--
**[Category N — Descriptive Title]**

One sentence description.

Mathematical statement: In ordinary mathematical language, state exactly what
object is being defined or what theorem is being asserted, including the
hypotheses and conclusion.

*Dependencies:* `dep1`, `dep2`
*Sources:* Author, Title, §Section
*Notes cross-ref:* §X.Y [#anchor](path/to/file.md#anchor)
*Proof status:* proved | proof pending
-/
```

The display name must exactly match the bold header in the
corresponding markdown notes file.

During statement-import passes, a temporary Lean-signature statement is
acceptable when the source prose is not yet curated:

```lean4
Mathematical statement (Lean): `theorem Foo (x : X) : P x`.
```

Replace temporary Lean-signature statements with ordinary mathematical language
before marking the chapter complete.

---

## 4. Definition Template

Every `N_rec` definition must have the iterator configuration
comment above it:

```lean4
/--
**[Definition N — Name]**

Description.

*Iterator configuration:*
  W = ...
  c = ...
  g = ...
-/
noncomputable def name (x y : N) : N :=
  N_rec (base x) (step x) y
```

---

## 5. No Mathlib Imports in VolumeII

The following are forbidden in any file under `LRA/VolumeII/`:

```lean4
import Mathlib           -- forbidden
import Mathlib.Tactic    -- forbidden
import Batteries         -- forbidden
```

Only core Lean 4 (`Init`) is permitted.

---

## 6. Proof Length Budget

| Item | Expected length |
|---|---|
| Base/step clause | 1–2 lines |
| Uniqueness citation | 1–3 lines |
| Simple algebraic law | 5–10 lines |
| Complex algebraic law | 10–20 lines |
| B1-bridge | 20–35 lines |
| Iterator theorem | 3–5 lines |

If a proof exceeds its budget, extract a lemma.
