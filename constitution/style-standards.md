# Style Standards
## lra-lean — Lean 4 Formatting and Naming Rules

---

## 1. Namespace

All VolumeII definitions live in `namespace Landau`.
Do not use dot notation on N (e.g. do not write `N.add_comm`).
Cite theorems as `Landau.add_comm`.

---

## 2. Naming Convention

### Definitions
`snake_case` noun: `plus`, `mul`, `exp`, `is_odd`, `is_even`

### Theorems
`snake_case` verb phrase from the conclusion:

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

Every `theorem`, `lemma`, `corollary`, and `def` must have a
doc-comment with a display name in this exact format:

```lean4
/--
**[Category N — Descriptive Title]**

One sentence description.

*Dependencies:* `dep1`, `dep2`
*Sources:* Author, Title, §Section
*Notes cross-ref:* §X.Y [#anchor](path/to/file.md#anchor)
-/
```

The display name must exactly match the bold header in the
corresponding markdown notes file.

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
