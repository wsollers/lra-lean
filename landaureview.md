# Landau-Style Operation Laws Review

## Overall verdict

Keep the architecture. Do not start proving all the `sorry`s yet.

The scaffold is mathematically much stronger than a typical "algebra properties" library because it correctly separates:

- closure;
- associativity;
- commutativity;
- identities;
- inverses;
- cancellation;
- absorbing elements;
- distributivity;
- idempotence;
- nilpotence;
- equality/congruence;
- order compatibility;
- embeddings;
- restricted versions such as cancellation on nonzero elements.

That separation is exactly what this project wants pedagogically. In particular, it is better not to introduce `Group`, `Ring`, `Field`, and related structures as the first objects. First understand what the individual laws say, what they imply, what they do **not** imply, and then assemble them into named structures.

Before proof implementation, however, I would make one significant architectural pass. There are four categories of changes:

1. Add a proper relation-law hierarchy.
2. Add named compound law/structure predicates.
3. Separate primitive hypotheses from derived consequences.
4. Repair several predicates whose present mathematical meaning is too weak or nonstandard.

There are only a few places I would call genuinely problematic; most of the current statements are mathematically sound.

---

# 1. The largest missing piece: generic relation laws

This is the most important omission given the stated goal.

Operations and relations should be two parallel foundational tracks:

\[
\text{operations}
\qquad\qquad
\text{relations}
\]

and later they meet through order compatibility, congruence, monotonicity, etc.

A relation-law directory should look roughly like:

```text
Relation/
  Reflexive/
  Irreflexive/
  Symmetric/
  Antisymmetric/
  Asymmetric/
  Transitive/
  Total/
  Trichotomous/
  Equivalence/
  Preorder/
  PartialOrder/
  LinearOrder/
  StrictPartialOrder/
  StrictLinearOrder/
```

The basic predicates should be approximately:

\[
\operatorname{Reflexive}(R)
\iff
\forall x,\;R(x,x),
\]

\[
\operatorname{Irreflexive}(R)
\iff
\forall x,\;\neg R(x,x),
\]

\[
\operatorname{Symmetric}(R)
\iff
\forall x,y,\;R(x,y)\Rightarrow R(y,x),
\]

\[
\operatorname{Antisymmetric}(R)
\iff
\forall x,y,\;(R(x,y)\land R(y,x))\Rightarrow x=y,
\]

\[
\operatorname{Asymmetric}(R)
\iff
\forall x,y,\;R(x,y)\Rightarrow\neg R(y,x),
\]

\[
\operatorname{Transitive}(R)
\iff
\forall x,y,z,\;(R(x,y)\land R(y,z))\Rightarrow R(x,z).
\]

Then define compound notions:

\[
\operatorname{EquivalenceRelation}(R)
\iff
\text{Reflexive}(R)\land
\text{Symmetric}(R)\land
\text{Transitive}(R),
\]

\[
\operatorname{Preorder}(R)
\iff
\text{Reflexive}(R)\land
\text{Transitive}(R),
\]

\[
\operatorname{PartialOrder}(R)
\iff
\text{Reflexive}(R)\land
\text{Antisymmetric}(R)\land
\text{Transitive}(R),
\]

and similarly strict and linear orders.

This is not decorative terminology. These predicates tell later modules exactly what must be certified before something may properly be called an equivalence relation, partial order, linear order, and so on.

## Essential relationship theorems

Add, among others:

\[
\text{Asymmetric}(R)\Rightarrow\text{Irreflexive}(R),
\]

\[
\text{Irreflexive}(R)\land\text{Transitive}(R)
\Rightarrow
\text{Asymmetric}(R),
\]

\[
\text{Symmetric}(R)\land\text{Antisymmetric}(R)
\Rightarrow
R(x,y)\Rightarrow x=y,
\]

and the connections between strict and non-strict orders.

For example, given \(\le\), define

\[
x<y \iff x\le y\land x\ne y,
\]

and prove under partial-order hypotheses that \(<\) is irreflexive and transitive.

Conversely, from a strict order \(<\), define

\[
x\le y \iff x<y\lor x=y
\]

and derive the non-strict order properties.

This relation hierarchy should precede `OrderCompatibility`.

---

# 2. Add a layer of named compound structures

The atomic laws are good. Now the library needs the named combinations that say precisely:

> To satisfy Law/System X, these are the requirements.

For one binary endo-operation \(\star\):

## Magma

Merely:

\[
\star:S\times S\to S.
\]

Because the Lean type already says this, `BinaryEndoOperation S` essentially represents the algebraic closure component.

## Semigroup

\[
\operatorname{SemigroupLaw}(\star)
\iff
\operatorname{Associative}(\star).
\]

## Monoid

\[
\operatorname{MonoidLaws}(\star,e)
\iff
\operatorname{Associative}(\star)
\land
\operatorname{TwoSidedIdentity}(\star,e).
\]

## Commutative monoid

\[
\operatorname{CommutativeMonoidLaws}(\star,e)
\iff
\operatorname{MonoidLaws}(\star,e)
\land
\operatorname{Commutative}(\star).
\]

## Group

\[
\operatorname{GroupLaws}(\star,e,\iota)
\]

should require:

\[
\operatorname{Associative}(\star),
\]

\[
\operatorname{TwoSidedIdentity}(\star,e),
\]

\[
\operatorname{TwoSidedInverse}(\star,e,\iota).
\]

Then prove, rather than assume:

- inverse uniqueness;
- cancellation;
- \(\iota(e)=e\);
- \(\iota(\iota(a))=a\);
- inverse of a product;
- solution uniqueness for \(a\star x=b\);
- solution uniqueness for \(x\star a=b\).

## Abelian group

Add commutativity.

This is especially important because later the project can say:

> `IntegerAdditionLaws` proves that \((\mathbb Z,+,0,-)\) is an abelian group.

rather than making each later theorem manually carry several disconnected hypotheses everywhere.

---

# 3. Then do two-operation structures

The scaffold already has the component laws needed for most of this.

## Semiring-like laws

For \(+\), \(\cdot\), \(0\), \(1\):

- \(+\) associative;
- \(+\) commutative;
- \(0\) additive identity;
- \(\cdot\) associative;
- \(1\) multiplicative identity;
- multiplication distributes over addition;
- \(0\) absorbs multiplication.

Then distinguish whether absorption is **assumed** or **derived under stronger additive hypotheses**.

## Ring laws

A ring should combine:

- additive abelian group;
- multiplicative associativity;
- multiplication distributive over addition.

Then prove:

\[
0a=0,\qquad a0=0,
\]

\[
(-a)b=-(ab),
\]

\[
a(-b)=-(ab),
\]

\[
(-a)(-b)=ab.
\]

For a unital ring, add multiplicative identity.

For a commutative ring, add multiplicative commutativity.

## Division-ring / field layer

Do **not** require a global multiplicative inverse operation satisfying

\[
a^{-1}a=1
\]

for every \(a\), because \(0\) is not invertible.

The addition of `TwoSidedInvertibleOn` was therefore exactly the right instinct.

For a field-like system, use something equivalent to:

\[
\forall a,\;a\ne0\Rightarrow
\exists b,\;ab=ba=1.
\]

Or use a designated inverse operation satisfying those conditions **on nonzero elements**.

That distinction will matter enormously for \(\mathbb Q\) and \(\mathbb R\).

---

# 4. The `Inverse` architecture is mostly very good

This is one of the strongest sections.

It correctly distinguishes:

- `LeftInverse`;
- `RightInverse`;
- `LeftInverseOf`;
- `RightInverseOf`;
- `TwoSidedInverseOf`;
- total inverse operations;
- restricted invertibility.

And this theorem is exactly the right foundational result:

> A left inverse and a right inverse of the same element coincide under associativity and a two-sided identity.

Add the pointwise uniqueness theorem explicitly:

\[
ba=e,\quad
ac=e
\quad\Longrightarrow\quad
b=c.
\]

Then add:

## Identity is self-inverse

\[
e^{-1}=e.
\]

## Inverse involution

\[
(a^{-1})^{-1}=a.
\]

Do **not** assume this as primitive once group hypotheses are available.

## Shoes-and-socks theorem

\[
(ab)^{-1}=b^{-1}a^{-1}.
\]

This is one of the most illuminating early abstract-algebra theorems because it shows that inverses reverse composition/order.

In an abelian group it reduces to

\[
(ab)^{-1}=a^{-1}b^{-1}.
\]

## Equation-solving theorems

In a group:

\[
ax=b
\iff
x=a^{-1}b,
\]

and

\[
xa=b
\iff
x=ba^{-1}.
\]

These are very Landau-like: the familiar operation of "moving something across an equation" becomes a theorem instead of an informal manipulation.

---

# 5. `SignNegationLaws` should be redesigned

This is probably the second-largest architectural change I recommend.

Currently `SignNegationLaws` assumes all of:

- additive inverse behavior;
- involution;
- multiplication by \(-1\);
- negating either factor;
- product of two negatives;
- distributivity over subtraction.

Mathematically those statements are fine.

Pedagogically, however, several of them should be **theorems**, not defining requirements.

For example, in a ring-like setting:

\[
-a
\]

is the additive inverse of \(a\).

Then uniqueness of additive inverses gives

\[
-(-a)=a.
\]

Using distributivity:

\[
(-a)b+ab
=
((-a)+a)b
=
0b
=
0.
\]

Therefore

\[
(-a)b=-(ab).
\]

Likewise,

\[
a(-b)=-(ab).
\]

Then:

\[
(-a)(-b)
=
-((-a)b)
=
-(-(ab))
=
ab.
\]

And

\[
(-1)a=-a.
\]

Those are exactly the derivations the foundations layer should expose.

So instead of one giant primitive `SignNegationLaws`, use something like:

```text
Negation/
  Definition
  DerivedTheorems
```

with minimal inputs:

- additive group laws;
- multiplication;
- distributivity.

Then derive the standard sign rules.

---

# 6. Subtraction needs its own definitional bridge

Add:

\[
\operatorname{SubtractionDefinedByAdditionAndNegation}
(-,+,\operatorname{neg})
\]

meaning

\[
a-b=a+(-b).
\]

This is extremely important.

Otherwise `subtraction` can remain an unrelated binary function that merely happens to satisfy some laws.

The named operation "subtraction" should be pinned to its structural origin:

\[
a-b := a+(-b).
\]

Then prove:

\[
a-0=a,
\]

\[
0-a=-a,
\]

\[
a-a=0,
\]

\[
a-(-b)=a+b,
\]

\[
-(a-b)=b-a,
\]

\[
(a-b)-c=a-(b+c),
\]

and so on.

Similarly later:

\[
a/b := a\cdot b^{-1}
\]

where defined.

This is exactly the sort of "named operation pinned to the underlying relation/operation" theorem the project is aiming for.

---

# 7. `OrderCompatibility` needs order hypotheses surrounding it

The generic predicates themselves are useful:

```lean
LeftTranslationPreservesRelation relation operation
```

is a good general notion.

But `PositiveRightTranslationPreservesRelation` presently accepts an arbitrary predicate:

```lean
positive : Carrier -> Prop
```

There is no requirement that `positive` mean anything about `relation`.

So something could be called positive even if it meant an unrelated property.

Add named sign predicates derived from an order and zero:

\[
\operatorname{Positive}(x)
\iff
0<x,
\]

\[
\operatorname{Negative}(x)
\iff
x<0,
\]

\[
\operatorname{Nonnegative}(x)
\iff
0\le x,
\]

\[
\operatorname{Nonpositive}(x)
\iff
x\le0.
\]

Then prove order/multiplication interaction in terms of those.

For ordered additive structures:

\[
a\le b
\Rightarrow
a+c\le b+c.
\]

For ordered rings:

\[
a\le b,\;0\le c
\Rightarrow
ac\le bc,
\]

and

\[
a\le b,\;c\le0
\Rightarrow
bc\le ac.
\]

Then derive familiar sign rules.

This needs the relation-law hierarchy first.

---

# 8. Add monotone and antitone as named relational concepts

The translation-preservation laws are instances of a more general idea.

For unary maps \(f\):

\[
\operatorname{Monotone}(R_S,R_T,f)
\iff
xR_Sy\Rightarrow f(x)R_Tf(y).
\]

And

\[
\operatorname{Antitone}(R_S,R_T,f)
\iff
xR_Sy\Rightarrow f(y)R_Tf(x).
\]

Then:

- left translation by \(a\) is a unary map \(x\mapsto a\star x\);
- right translation by \(a\) is \(x\mapsto x\star a\).

The current laws then become specializations.

That produces a much cleaner conceptual hierarchy.

---

# 9. `EquationalLogic` contains useful teaching material, but distinguish automatic facts from algebraic laws

For an actual Lean function \(f\),

\[
x=y\Longrightarrow f(x)=f(y)
\]

is automatic.

Likewise every Lean binary function respects equality in each argument.

So:

```lean
UnaryEqualityCompatible operation
BinaryEqualityCompatible operation
```

are not really algebraic conditions that a number system needs to independently certify. They are consequences of equality itself and functionhood.

The existing theorems such as:

```lean
UnaryOperation.equality_compatible
BinaryOperation.equality_compatible
```

already recognize this.

Classify these as:

> **Logical infrastructure / automatic laws**

rather than alongside associativity and commutativity.

By contrast:

```lean
BinaryOperationCongruence relation operation
```

for an arbitrary equivalence relation is genuinely substantive.

That should be tied explicitly to quotient construction:

If \(\sim\) is an equivalence relation and

\[
a\sim a',\quad b\sim b'
\Longrightarrow
a\star b\sim a'\star b',
\]

then the operation descends to equivalence classes.

Add a named theorem/concept such as:

\[
\operatorname{WellDefinedOnQuotient}.
\]

This is not merely "equational logic"; it is a foundational bridge into number construction.

It will be important for:

- integers as equivalence classes;
- rationals as equivalence classes;
- possibly real-number constructions.

---

# 10. There is one misleading failure example in EquationalLogic

Using same parity and successor to show

> same parity does not permit replacing one number by another **as equality**

is correct.

But note the useful contrast:

\[
a\equiv b\pmod2
\Rightarrow
a+1\equiv b+1\pmod2.
\]

So successor **does preserve same parity as a congruence relation**, even though it does not preserve literal equality of outputs.

This is actually an excellent teaching example.

Make the contrast explicit:

## Failure

\[
a\sim b\nRightarrow f(a)=f(b).
\]

## Success

\[
a\sim b\Rightarrow f(a)\sim f(b).
\]

That sharply separates:

- equality substitution;
- compatibility with an equivalence relation.

Keep this example, but make both halves explicit.

---

# 11. `NumberEmbeddings`: one definition is effectively vacuous

This needs repair before proof work.

Currently:

```lean
def MixedOperationResultCarrier
    (operation : BinaryOperation Left Right Result) : Prop :=
  forall left right, exists result : Result, operation left right = result
```

For every total Lean function

```lean
operation : Left → Right → Result
```

this is automatically true: choose

```lean
result := operation left right
```

So it does not certify anything.

It should probably disappear as a law.

The **type itself**

```lean
BinaryOperation Left Right Result
```

already certifies the result carrier.

This is a good example of something Lean's type system should encode rather than something proved propositionally.

---

# 12. `RelationEmbedding` should probably require injectivity

The current definition is effectively:

\[
\text{preserves relation}
\land
\text{reflects relation}.
\]

That does **not**, for an arbitrary relation, force the map to be injective.

For example, if both relations are universal relations, even a constant map preserves and reflects them.

Standard embedding language normally includes injectivity.

I recommend:

```text
RelationHomomorphism
    := preserves

RelationBimorphism   -- or relation-preserving-and-reflecting
    := preserves ∧ reflects

RelationEmbedding
    := injective ∧ preserves ∧ reflects
```

This gives the useful hierarchy:

\[
\text{isomorphism}
\Rightarrow
\text{embedding}
\Rightarrow
\text{homomorphism}.
\]

---

# 13. Expand the map/homomorphism hierarchy substantially

This will become indispensable once the number systems start talking to each other.

The generic layer should include:

- identity map;
- composition of maps;
- injective map;
- surjective map;
- bijective map;
- homomorphism;
- embedding;
- isomorphism.

And preservation theorems.

For example, if

\[
f:A\to B
\]

is injective and operation-preserving:

\[
f(a\star_A b)
=
f(a)\star_B f(b),
\]

then laws in the target can often be **reflected** to the source.

For example, target associativity gives:

\[
\begin{aligned}
f((a\star b)\star c)
&=
(f(a)\star f(b))\star f(c)\\
&=
f(a)\star(f(b)\star f(c))\\
&=
f(a\star(b\star c)).
\end{aligned}
\]

Injectivity therefore yields:

\[
(a\star b)\star c=a\star(b\star c).
\]

Add generic transport theorems for:

- associativity;
- commutativity;
- identity, when distinguished elements are preserved;
- absorbing elements;
- idempotence;
- distributivity;
- relation properties;
- order preservation.

These will let canonical embeddings preserve arithmetic rather than forcing familiar algebraic equalities to be reproved from scratch every time.

---

# 14. Canonical embeddings need a much richer certification contract

For the eventual chain

\[
\mathbb N\hookrightarrow\mathbb Z
\hookrightarrow\mathbb Q
\hookrightarrow\mathbb R
\hookrightarrow\mathbb C,
\]

each embedding should eventually certify:

\[
\iota(0)=0,
\]

\[
\iota(1)=1,
\]

\[
\iota(a+b)=\iota(a)+\iota(b),
\]

\[
\iota(ab)=\iota(a)\iota(b),
\]

and where meaningful:

\[
a\le b
\iff
\iota(a)\le\iota(b).
\]

Plus injectivity.

This gives the theorem:

> The smaller system occurs inside the larger system with its arithmetic structure preserved.

That is mathematically much stronger than merely providing a coercion.

I would make this one of the flagship themes of this library.

---

# 15. Nilpotence needs one conceptual adjustment

The exponent-zero problem was repaired well by introducing `PositivePower`.

But presently `NilpotentElement` is defined for an **arbitrary binary endo-operation**.

For a nonassociative operation,

\[
aaa
\]

has no unique algebraic meaning:

\[
(aa)a
\]

need not equal

\[
a(aa).
\]

The recursion chooses one association.

That is formally legitimate, but it is not quite the ordinary mathematical meaning of "nilpotent element."

Two options:

## Option A — require associativity

Make standard `NilpotentElement` live in an associative context.

## Option B — rename the weak notion

Call it something like:

```text
LeftIteratedNilpotent
```

or

```text
RightIteratedNilpotent
```

and derive ordinary nilpotence under associativity.

Option B is preferable for this project because it exposes exactly **why associativity matters**.

---

# 16. Powers deserve their own major topic

Move `OperationPower` out of Nilpotent.

Have a generic:

```text
Iteration/
Power/
```

topic.

Under associativity + identity prove:

\[
a^0=e,
\]

\[
a^1=a,
\]

\[
a^{n+1}=a^n\star a,
\]

\[
a^{m+n}=a^m\star a^n.
\]

Then:

\[
(a^m)^n=a^{mn}.
\]

For commutative operations:

\[
(a\star b)^n=a^n\star b^n.
\]

This will later give arithmetic exponent laws by specialization rather than rediscovery.

This deserves far more prominence than merely supporting nilpotence.

---

# 17. Add interaction theorems that expose surprising consequences

This is where the library can become genuinely illuminating.

Some particularly good ones:

## Identity and absorber coincide only in a trivial carrier

If \(e\) is an identity and \(z\) an absorber and

\[
e=z,
\]

then for every \(x\),

\[
x=e.
\]

That is a beautiful theorem showing why \(0\neq1\) is necessary for nontrivial rings.

Later:

\[
0=1
\Longrightarrow
\text{the ring has exactly one element}.
\]

## Idempotent + cancellation + identity collapses the carrier

If

\[
a\star a=a
\]

for all \(a\), and there is appropriate cancellation and an identity, then every element equals the identity.

Again: useful structural incompatibility.

## Inverses imply cancellation

This is already present. Make it central.

## Commutativity collapses left/right distinctions

Several such theorems are already present. Extend the pattern systematically:

- left identity \(\Rightarrow\) right identity under commutativity;
- left absorber \(\Rightarrow\) right absorber;
- left cancellation \(\Rightarrow\) right cancellation;
- left inverse \(\Rightarrow\) right inverse;
- left distributivity \(\Rightarrow\) right distributivity where the relevant operation is commutative.

This makes "commutativity as a left/right symmetry principle" a coherent lesson.

---

# 18. Add independence/counterexample matrices

The failure-mode idea is excellent. It should be expanded.

A key learning goal should be:

> None of these familiar algebraic laws should be unconsciously conflated.

Construct a matrix such as:

| Operation | Associative | Commutative | Identity | Cancellative | Idempotent | Absorber |
|---|---:|---:|---:|---:|---:|---:|
| \(+\) on \(\mathbb N\) | ✓ | ✓ | ✓ | ✓ | ✗ | ✗ |
| \(\times\) on \(\mathbb N\) | ✓ | ✓ | ✓ | ✗ | ✗ | ✓ |
| subtraction on \(\mathbb Z\) | ✗ | ✗ | one-sided phenomena | ✗ | ✗ | ✗ |
| Boolean AND | ✓ | ✓ | ✓ | ✗ | ✓ | ✓ |
| Boolean OR | ✓ | ✓ | ✓ | ✗ | ✓ | ✓ |
| first projection \(a\star b=a\) | ✓ | ✗ | one-sided | ✗ | ✓ | one-sided |
| second projection \(a\star b=b\) | ✓ | ✗ | opposite side | ✗ | ✓ | opposite side |

Then explicitly demonstrate:

- associative does not imply commutative;
- commutative does not imply associative;
- identity need not exist;
- left identity need not be right identity;
- cancellation need not follow from associativity;
- idempotence does not imply absorption;
- absorption does not imply identity.

These examples are pedagogically almost as important as the positive theorems.

---

# 19. Add tiny finite countermodels

Do not rely only on arithmetic operations for failures.

Two- and three-element carriers are often superior because they prove independence cleanly.

For example, define an operation by a Cayley table and show:

- commutative but nonassociative;
- associative but noncommutative;
- left identity but no right identity;
- right inverse behavior without left inverse behavior when associativity/identity hypotheses are absent.

These are perfect Lean examples because all cases are finite.

They also teach an important foundational lesson:

> A theorem's hypotheses really are necessary.

---

# 20. Closure is conceptually good, but explicitly distinguish three meanings

The closure section is good. Make this distinction prominent:

## Untyped/set-theoretic closure

Given \(A\subseteq X\) and

\[
\star:X\times X\to X,
\]

closure means

\[
a,b\in A\Rightarrow a\star b\in A.
\]

## Typed endo-operation

If Lean already has

```lean
operation : A → A → A
```

then closure on the full carrier is encoded by the type.

## Subcarrier closure

If

```lean
A : X → Prop
```

represents a subset, closure becomes a genuine proposition again.

The current definitions already support this. Make the conceptual distinction an explicit lesson because it teaches something important about formalization.

---

# 21. Add existence separately from possession of a named identity

At the moment:

```lean
TwoSidedIdentity operation identity
```

means a particular `identity` works.

Also add:

\[
\operatorname{HasLeftIdentity}(\star)
\iff
\exists e,\operatorname{LeftIdentity}(\star,e),
\]

\[
\operatorname{HasRightIdentity}(\star),
\]

\[
\operatorname{HasIdentity}(\star).
\]

Then prove:

\[
\operatorname{HasLeftIdentity}
\land
\operatorname{HasRightIdentity}
\Rightarrow
\operatorname{HasIdentity}.
\]

Because any left identity and right identity coincide.

This cleanly separates:

> "Here is the identity."

from

> "An identity exists."

Do the analogous thing for absorbers.

---

# 22. Likewise distinguish existence, uniqueness, and chosen data throughout

This is a very useful foundational pattern.

For inverse, make it systematic:

1. **Property of a candidate**
   \[
   \operatorname{InverseOf}(a,b).
   \]

2. **Existence**
   \[
   \operatorname{Invertible}(a)
   :=
   \exists b\,\operatorname{InverseOf}(a,b).
   \]

3. **Uniqueness theorem**
   \[
   \operatorname{InverseOf}(a,b)\land
   \operatorname{InverseOf}(a,c)
   \Rightarrow b=c.
   \]

4. **Chosen operation**
   \[
   \operatorname{inv}:A\to A.
   \]

This fits beautifully with the general foundational pattern: existence, uniqueness, then canonical chosen object.

---

# 23. Add zero-divisor language

This is a major omission if these laws are supposed to prepare the number systems.

For multiplication with zero:

\[
\operatorname{LeftZeroDivisor}(a)
\iff
a\ne0\land
\exists b\ne0,\;ab=0.
\]

Likewise right zero divisor.

Then add:

\[
\text{NoZeroDivisors}
\]

and:

\[
ab=0
\Rightarrow
a=0\lor b=0.
\]

This connects directly to cancellation.

For multiplication in an appropriate structure, nonzero cancellability is closely connected to absence of zero divisors.

This is one of the most important bridges from elementary arithmetic to abstract algebra.

---

# 24. Add units

Likewise:

\[
\operatorname{Unit}(a)
\iff
\exists b,\;ab=ba=1.
\]

Then prove:

- identity is a unit;
- inverse of a unit is a unit;
- product of units is a unit;
- units cancel;
- units form a group under multiplication.

Then:

- in \(\mathbb Z\), the units are \(\pm1\);
- in a field, every nonzero element is a unit.

That will make the field abstraction much more understandable.

---

# 25. Add characteristic later in this layer or immediately above it

Eventually define repeated addition:

\[
n\cdot 1.
\]

Then define characteristic and prove the usual foundational facts.

This belongs naturally after powers/iteration and before the number-system comparison work.

---

# 26. Add homomorphism preservation as a major theorem family

Once structure bundles exist, define mappings between them.

For monoids:

\[
f(a\star_A b)
=
f(a)\star_B f(b),
\]

\[
f(e_A)=e_B.
\]

Then prove:

\[
f(a^n)=f(a)^n.
\]

For groups:

\[
f(a^{-1})=f(a)^{-1}.
\]

For rings:

\[
f(-a)=-f(a),
\]

\[
f(a-b)=f(a)-f(b).
\]

These results will make canonical number embeddings far cleaner.

---

# 27. Order should eventually produce named ordered structures

Once relations and algebraic structures exist, define:

## Ordered additive commutative monoid

Order + addition compatibility.

## Ordered abelian group

Abelian group + order + translation invariance.

## Ordered ring

Ring + compatible order.

## Linearly ordered field

Field + linear order + compatibility.

Then the eventual real-number certification can say:

\[
(\mathbb R,+,\cdot,0,1,\le)
\]

is a **complete linearly ordered field**.

That gives the whole project a very clean endpoint.

---

# 28. Axiom/law versus theorem should be visible in the file organization

This is important for a Landau-inspired development.

For every topic, organize around:

```text
Definition
Requirements
ImmediateConsequences
InteractionTheorems
Examples
Counterexamples
```

For example:

## Associativity

**Definition**

\[
(a\star b)\star c=a\star(b\star c).
\]

**Requirements**

Exactly that equation for every \(a,b,c\).

**Consequences**

Arbitrary reassociation.

**Does not imply**

- identity;
- commutativity;
- cancellation;
- inverse.

**Examples**

Addition, multiplication, function composition.

**Counterexamples**

Subtraction, division.

This makes the mathematical epistemology extremely clear.

---

# 29. There are some pedagogical aliases that can be removed later

For example, in Associative:

- `Associative.apply`
- `Associative.reassociate_left`
- `Associative.preserves_left_nested_shape`

are mathematically the same statement.

During learning this is not harmful.

Eventually keep something like:

```lean
Associative.apply
Associative.symm_apply
```

and reserve `Relationships.lean` for actual interactions rather than restating the definition.

---

# 30. A few especially important examples are missing

Add these to the core canonical example bank.

## Function composition

Composition is:

- associative;
- generally not commutative;
- has identity maps;
- invertible exactly for bijections in the appropriate setting.

This is probably the single best non-number example of why associativity and commutativity differ.

## Set union

- associative;
- commutative;
- idempotent;
- identity \(\varnothing\).

## Set intersection

- associative;
- commutative;
- idempotent;
- identity \(U\) relative to a universe;
- absorber \(\varnothing\).

## Matrix multiplication

- associative;
- generally not commutative;
- identity exists;
- not every matrix invertible.

This is an excellent example because it destroys several arithmetic intuitions simultaneously.

## Function composition + invertible functions

Gives a naturally noncommutative group.

## Boolean XOR

This is already used for inverses. Good choice.

## Modular arithmetic

For \(\mathbb Z/n\mathbb Z\):

- addition gives an abelian group;
- multiplication has zero divisors for composite \(n\);
- nonzero multiplicative cancellation holds exactly under appropriate unit/no-zero-divisor conditions.

This will be invaluable later.

---

# 31. Important failure modes to explicitly include

Make sure the catalogue contains all of these:

- closure failure;
- left identity without right identity;
- right identity without left identity;
- no identity;
- multiple left identities possible;
- multiple right identities possible;
- two-sided identity unique;
- left inverse without right inverse if associativity/identity assumptions are absent;
- nonunique one-sided inverses in weak structures;
- failure of associativity;
- failure of commutativity;
- failure of cancellation due to absorber;
- failure of multiplication cancellation at zero;
- failure from zero divisors;
- distributivity only one direction in noncommutative situations;
- idempotence without identity;
- identity without idempotence;
- order preservation under positive multiplication;
- order reversal under negative multiplication;
- failure of monotonicity without sign restriction;
- homomorphism that is not injective;
- injective map that is not a homomorphism;
- relation-preserving map that is not relation-reflecting;
- operation preservation without identity preservation.

That last group will make the embeddings chapter significantly more illuminating.

---

# 32. Suggested revised dependency graph

Change the learning spine to approximately:

```text
Functions / Operations
        │
        ├── Closure
        │
        └── Iteration
                │
                └── Powers

Relations
  ├── Reflexive
  ├── Symmetric
  ├── Transitive
  ├── Antisymmetric
  ├── ...
  ├── Equivalence
  └── Orders
        │
        └── Monotone / Antitone

Equality / Congruence
        │
        └── Quotient Well-Definedness

Binary Operation Laws
  ├── Identity
  ├── Associative
  ├── Commutative
  ├── Absorbing
  ├── Idempotent
  └── Cancellation
        │
        └── Inverse
              │
              ├── Semigroup
              ├── Monoid
              └── Group

Two-Operation Laws
        └── Distributivity
              │
              ├── Semiring-like structures
              └── Ring-like structures
                    │
                    ├── Negation
                    ├── Subtraction
                    ├── Zero divisors
                    └── Units

Order + Operations
        │
        ├── Ordered groups
        ├── Ordered rings
        └── Ordered fields

Maps Between Structures
  ├── Homomorphism
  ├── Embedding
  └── Isomorphism
        │
        └── Canonical Number Embeddings
```

That is the mature version of what the current scaffold is already trying to become.

---

# What I would change before writing any proofs

Treat these as the blocking changes:

1. **Add generic relation laws.**
2. **Change `RelationEmbedding` to include injectivity, or rename the current weaker notion.**
3. **Delete or redesign `MixedOperationResultCarrier`; it is vacuous.**
4. **Move powers/iteration out of Nilpotent.**
5. **Either require associativity for ordinary nilpotence or rename the weak iterated notion.**
6. **Split `SignNegationLaws` into minimal prerequisites and derived theorems.**
7. **Add the definition connecting subtraction with addition and additive inverse.**
8. **Add `HasIdentity`, `HasAbsorber`, `Invertible`, etc., separating existence from chosen witnesses.**
9. **Add named aggregate predicates: Semigroup, Monoid, Group, AbelianGroup, Ring-like contracts, etc.**
10. **Tie Positive/Negative explicitly to an order and zero before using those names as mathematical sign concepts.**

After those changes, the scaffold is genuinely ready for systematic proof work.

## Bottom line

The central idea is sound: **Volume I should establish a calculus of laws; Volume II should certify structures against it.** That is a very good foundation for the number-system development.

The current scaffold already captures most of the important atomic operation laws correctly.

What it lacks is the middle layer:

\[
\boxed{\text{atomic laws}}
\longrightarrow
\boxed{\text{named structures + interaction theorems}}
\longrightarrow
\boxed{\text{concrete number systems}}.
\]

Right now the project has the first box and is preparing for the third. Build that middle box before proving the scaffold.

Once it exists, statements such as

\[
\mathbb N\text{ is a commutative semiring},
\]

\[
\mathbb Z\text{ is an ordered commutative ring},
\]

\[
\mathbb Q\text{ is an ordered field},
\]

and eventually

\[
\mathbb R\text{ is a complete ordered field}
\]

become **certification theorems whose assumptions and consequences have already been independently understood and proved**. That is exactly the Landau-inspired architecture this project is aiming for.
