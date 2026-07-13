# Lean Learning Notes

## Relations As Predicates And Sets Of Pairs

In Lean, a relation is usually represented as a predicate, not as an explicit
set of ordered pairs.

A heterogeneous binary relation is:

```lean
R : α → β → Prop
```

Read `R a b` as "`a` is related to `b`."

This is logically equivalent to a set of ordered pairs:

```lean
Set (α × β)
```

because a set in Lean is also a predicate:

```lean
Set (α × β) = (α × β) → Prop
```

So these two representations are equivalent:

```lean
R1 : α → β → Prop
R2 : α × β → Prop
```

They differ by currying:

```lean
def relationToSet {α β} (R : α → β → Prop) : (α × β) → Prop :=
  fun pair => R pair.1 pair.2

def setToRelation {α β} (S : (α × β) → Prop) : α → β → Prop :=
  fun a b => S (a, b)
```

The notes can say "a relation is a set of ordered pairs," while Lean proof code
can often use the more ergonomic curried predicate form.

A relation does not necessarily map each `a` to a unique `b`; that is a
function. A relation can relate one input to no outputs, one output, many
outputs, or share outputs across many inputs.

## Polish Integer And Mathlib Integer Interop Tests

The Polish two-sided integer construction lives in Volume II, where the project
keeps proofs first-principles and avoids Mathlib-dependent validation. Testing
that construction against Mathlib's `Int` is still valuable, but it belongs in
Volume III because Volume III is the Mathlib-backed interoperability layer.

The interop test uses explicit bridge functions instead of global mixed
operator instances. For example, a Polish-left addition bridge converts the
Polish value to `Int` and returns a Mathlib integer:

```lean
def polishAddMathlib (left : PolishZ) (right : Int) : Int :=
  toMathlibInt left + right
```

The opposite direction returns a Polish integer:

```lean
def mathlibAddPolish (left : Int) (right : PolishZ) : PolishZ :=
  ofMathlibInt (left + toMathlibInt right)
```

This tests both directions without teaching Lean a global rule for adding
mixed Polish/Mathlib integers. That is intentional: global mixed-operation
instances can make notation surprising and can create typeclass search
ambiguity. Explicit bridge functions keep the experiment readable and local.

The test also defines both conversions:

```lean
toMathlibInt : PolishZ → Int
ofMathlibInt : Int → PolishZ
```

Then small `example` checks exercise addition, multiplication, subtraction,
negation, `<`, and `≤` in both left/right directions. The goal is not to prove
a full isomorphism yet; it is to provide a compile-checked smoke test that the
two representations agree on concrete arithmetic and order behavior.
