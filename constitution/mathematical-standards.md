# Mathematical Standards
## lra-lean — VolumeII Correctness Rules

---

## 1. One-Based Convention

VolumeII uses the one-based convention throughout: the
distinguished element is `one : N`, not `zero`. Every definition,
theorem, and example must respect this.

- Addition base clause: `plus x one = successor x`
- Multiplication base clause: `mul x one = x`
- Exponentiation base clause: `exp x one = x`

Do NOT introduce zero-based definitions. Zero is introduced when
the whole numbers W = {0} ∪ N are constructed.

---

## 2. Strict Dependency Order

Every item may only use items defined earlier in the dependency chain.

```
Axioms (N, one, successor, A3, A4, A5, N_rec)
  └── Recursion (iterator theorem lemmas)
        └── Addition
              └── Multiplication
                    └── Exponentiation
                          └── Order
                                └── Division
```

Violating this order — for example, using multiplication inside
an addition proof — is a hard error.

---

## 3. No Subtraction on N

True subtraction (`m - n`) is not a total function on N.
Do not define it, use it, or reference it in VolumeII.
Subtraction is defined on Z in a later volume.

---

## 4. No sorry in VolumeII

The `sorry` tactic is forbidden in any file under `LRA/VolumeII/`.
Every proof must be complete. Use proof stubs with explicit
`sorry`-free placeholders only on named `theorem` lines in
draft files, and only when the theorem is marked `-- STUB`.

---

## 5. Existence and Uniqueness Must Both Be Proved

Every recursive definition must have both:
- An existence proof (provided by `N_rec` + the iterator theorem)
- A uniqueness proof (citing `iterator_unique` or equivalent)

Defining a function without proving uniqueness is incomplete.

---

## 6. Peano Axioms Are the Only Foundation

No facts about N may be assumed beyond what follows from
A3, A4, A5_Induction, N_rec, N_rec_one, and N_rec_succ.
Do not import or assume anything from Mathlib about natural numbers.
