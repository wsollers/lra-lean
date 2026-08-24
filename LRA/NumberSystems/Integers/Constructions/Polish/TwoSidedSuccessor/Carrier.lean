
namespace LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor

/--
`P` TODO

Predicate logic:

  inductive P : Type where
  | succZero : P
  | succ : P → P

Predicate logic (unfolded):

  inductive P : Type where
  | succZero : P
  | succ : P → P (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive P : Type where
  | succZero : P
  | succ : P → P
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
inductive P : Type where
  | succZero : P
  | succ : P → P

/--
`N` TODO

Predicate logic:

  inductive N : Type where
  | predZero : N
  | pred : N → N

Predicate logic (unfolded):

  inductive N : Type where
  | predZero : N
  | pred : N → N (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive N : Type where
  | predZero : N
  | pred : N → N
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
inductive N : Type where
  | predZero : N
  | pred : N → N

/--
`Z` TODO

Predicate logic:

  inductive Z : Type where
  | zero : Z
  | pos : P → Z
  | neg : N → Z

Predicate logic (unfolded):

  inductive Z : Type where
  | zero : Z
  | pos : P → Z
  | neg : N → Z (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive Z : Type where
  | zero : Z
  | pos : P → Z
  | neg : N → Z
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
inductive Z : Type where
  | zero : Z
  | pos : P → Z
  | neg : N → Z

open Z

/--
`succ` TODO

Predicate logic:

  def succ : Z → Z
  | zero => pos P.succZero
  | pos p => pos (P.succ p)
  | neg n =>
      match n with
      | N.predZero => zero
      | N.pred n' => neg n'

Predicate logic (unfolded):

  def succ : Z → Z
  | zero => pos P.succZero
  | pos p => pos (P.succ p)
  | neg n =>
      match n with
      | N.predZero => zero
      | N.pred n' => neg n' (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def succ : Z → Z
  | zero => pos P.succZero
  | pos p => pos (P.succ p)
  | neg n =>
      match n with
      | N.predZero => zero
      | N.pred n' => neg n'
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def succ : Z → Z
  | zero => pos P.succZero
  | pos p => pos (P.succ p)
  | neg n =>
      match n with
      | N.predZero => zero
      | N.pred n' => neg n'

/--
`pred` TODO

Predicate logic:

  def pred : Z → Z
  | zero => neg N.predZero
  | pos p =>
      match p with
      | P.succZero => zero
      | P.succ p' => pos p'
  | neg n => neg (N.pred n)

Predicate logic (unfolded):

  def pred : Z → Z
  | zero => neg N.predZero
  | pos p =>
      match p with
      | P.succZero => zero
      | P.succ p' => pos p'
  | neg n => neg (N.pred n) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def pred : Z → Z
  | zero => neg N.predZero
  | pos p =>
      match p with
      | P.succZero => zero
      | P.succ p' => pos p'
  | neg n => neg (N.pred n)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def pred : Z → Z
  | zero => neg N.predZero
  | pos p =>
      match p with
      | P.succZero => zero
      | P.succ p' => pos p'
  | neg n => neg (N.pred n)

/--
`one` TODO

Predicate logic:

  def one : Z := Z.pos P.succZero

Predicate logic (unfolded):

  def one : Z := Z.pos P.succZero (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def one : Z := Z.pos P.succZero
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def one : Z := Z.pos P.succZero

end LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor
