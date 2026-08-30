# Maps, Functions, and Operators (`[RECAP]`)

[← Back to Index](00-index.md)

## 4.0 Geometric Intuition

A function is a relation with a promise: from each starting point, exactly one arrow leaves. "Map," "function," and "operator" are the same object under three hats — function (general, number-flavored codomain), map (general, set/geometric-flavored), operator (domain = codomain, or spaces-of-functions flavored: $T:V\to V$, differential operators). No formal distinction, only role.

## 4.1 Signature

$$\mathrm{IsFunction}(f,A,B) :\equiv f\subseteq A\times B \wedge \forall a\in A\,\exists!b\in B((a,b)\in f)$$

Function equality via Extensionality: same domain, same pointwise values. $f[X]:=\{f(x):x\in X\}$ (image); $f^{-1}[Y]:=\{x\in A:f(x)\in Y\}$ (preimage, defined for every $f$); fiber $\mathrm{fib}_f(b):=f^{-1}[\{b\}]$.

## 4.2 Injective/Surjective/Bijective via Fibers

$$\mathrm{Injective}(f):\equiv\forall a,a'(f(a)=f(a')\to a=a') \qquad \mathrm{Surjective}(f):\equiv\forall b\,\exists a(f(a)=b)$$

**Theorem (fiber characterization).** $\mathrm{Injective}(f)\leftrightarrow\forall b(|\mathrm{fib}_f(b)|\le1)$; $\mathrm{Surjective}(f)\leftrightarrow\forall b(\mathrm{fib}_f(b)\neq\varnothing)$; $\mathrm{Bijective}(f)\leftrightarrow\forall b(|\mathrm{fib}_f(b)|=1)$. Fiber-size is the single unifying invariant.

## 4.3 Restriction, Extension, Composition, Inverse

**Remark (flagged notational clash).** $f^{-1}(b)$ (inverse function, needs bijective) vs. $f^{-1}[Y]$ (preimage, always defined) — do not conflate.

**Theorem.** $\mathrm{Bijective}(f)\to f^{-1}\circ f=\mathrm{id}_A \wedge f\circ f^{-1}=\mathrm{id}_B$. Composition is associative.

**Theorem (left/right invertibility, AC flagged).** $\mathrm{Injective}(f)\leftrightarrow\exists g(g\circ f=\mathrm{id}_A)$ (no Choice needed); $\mathrm{Surjective}(f)\leftrightarrow\exists g(f\circ g=\mathrm{id}_B)$ ($\Leftarrow$ direction needs AC — choosing one representative per fiber).

## 4.4 The Monoid/Group of Operators

$\mathrm{Fun}(S,S):=\{f:f:S\to S\}$. **Theorem.** $(\mathrm{Fun}(S,S),\circ)$ is a monoid with identity $\mathrm{id}_S$. $\mathrm{Sym}(S):=\{f\in\mathrm{Fun}(S,S):\mathrm{Bijective}(f)\}$. **Theorem.** $(\mathrm{Sym}(S),\circ)$ is a group; group-inverse of $f$ is exactly the inverse function $f^{-1}$.

## 4.5 Pointwise Algebra — The Second Notational Clash

**Definition.** $(f\circledast g)(x):=f(x)*g(x)$. **Theorem (transfer of laws).** If $(S,*)$ is monoid/group/abelian group, so is $(\mathrm{Fun}(X,S),\circledast)$.

**Flagged, load-bearing for the project.** Compositional structure ($f^{-1}$ = "undo the map," may not exist) and pointwise structure ($-f$, $fg$ meaning $x\mapsto f(x)g(x)$, NOT $f\circ g$) coexist on the same function set and do not agree — must be explicit which is meant whenever drift/diffusion coefficient fields on $\mathbb T^2$ are manipulated.

## 4.6 Image/Preimage vs. Set Operations — the Asymmetry, Fully General

**Theorem.** $f[\bigcup X_i]=\bigcup f[X_i]$ always; $f[\bigcap X_i]\subseteq\bigcap f[X_i]$, equality can fail (counterexample: $f:\{1,2\}\to\{0\}$ constant, $X_1=\{1\},X_2=\{2\}$). **Theorem.** Injectivity restores equality in both the intersection and difference clauses. **Theorem.** Preimage distributes over $\cup,\cap,\setminus$, complement — ALWAYS, no injectivity needed, since preimage unwinds via one unquantified biconditional.

**Theorem (round trips).** $f[f^{-1}[Y]]\subseteq Y$, equality for all $Y$ iff surjective; $f^{-1}[f[X]]\supseteq X$, equality for all $X$ iff injective.

## 4.7 Duality — Categorical/Arrow-Reversal

**Theorem.** Injective/surjective are categorical duals: injective failure = collapsing, surjective failure = gaps; bijection is the unique case with neither. Left-inverse $\leftrightarrow$ injective, right-inverse $\leftrightarrow$ surjective is the precise dual pair (reversing $g\circ f=\mathrm{id}_A$).

## 4.8 Indexed Families of Functions

$\{f_i\}_{i\in I}$ is a function $F:I\to\mathrm{Fun}(A,B)$. Pointwise $\sup/\inf$ of a family when $B$ is ordered. **Theorem.** Composition distributes over indexed pointwise sup/inf when the outer function is order-preserving — equality only for an order-isomorphism, otherwise only $\ge$ in general (flagged failure mode, direct analogue of the injectivity-restores-equality pattern).

**Summary map.**
```
Relations (R subset A x B) -> add exists-unique clause -> Function f: A -> B
   |
   +--> Injective/Surjective/Bijective via fiber-size
   +--> Restriction/Extension/Composition/Inverse (AC flagged for right-inverse)
   +--> Fun(S,S) is a MONOID under compose; Sym(S) is a GROUP ("operator" starts here)
   +--> Fun(X,S) pointwise-inherits (S,*)'s laws (second clash flagged)
   +--> Image/Preimage vs set ops: preimage ALWAYS distributes, image only sub-distributes
   +--> Indexed families, pointwise sup/inf -> feeds Topology (continuity) and
        Lipschitz-constant machinery for GPU step-size control
```

---

---

[← Back to Index](00-index.md)
