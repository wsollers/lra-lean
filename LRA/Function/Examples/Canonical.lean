import LRA.Function.Definition

namespace LRA.Function.Examples

universe u v

/--
`collapse` TODO

Predicate logic:

  def collapse : LRA.Function Bool Unit :=
  fun _ => ()

Predicate logic (unfolded):

  def collapse : LRA.Function Bool Unit :=
  fun _ => () (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def collapse : LRA.Function Bool Unit :=
  fun _ => ()
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
def collapse : LRA.Function Bool Unit :=
  fun _ => ()

/--
`shift` TODO

Predicate logic:

  def shift : Endofunction Nat :=
  Nat.succ

Predicate logic (unfolded):

  def shift : Endofunction Nat :=
  Nat.succ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def shift : Endofunction Nat :=
  Nat.succ
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
def shift : Endofunction Nat :=
  Nat.succ

/--
`vacuous` TODO

Predicate logic:

  def vacuous : LRA.Function Empty Bool :=
  fun input => nomatch input

Predicate logic (unfolded):

  def vacuous : LRA.Function Empty Bool :=
  fun input => nomatch input (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def vacuous : LRA.Function Empty Bool :=
  fun input => nomatch input
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
def vacuous : LRA.Function Empty Bool :=
  fun input => nomatch input

/--
`swap` TODO

Predicate logic:

  def swap : Endofunction Bool :=
  fun input => !input

Predicate logic (unfolded):

  def swap : Endofunction Bool :=
  fun input => !input (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def swap : Endofunction Bool :=
  fun input => !input
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
def swap : Endofunction Bool :=
  fun input => !input

/--
`constant` TODO

Predicate logic:

  def constant {Domain : Type u} {Codomain : Type v}
    (output : Codomain) : LRA.Function Domain Codomain :=
  fun _ => output

Predicate logic (unfolded):

  def constant {Domain : Type u} {Codomain : Type v}
    (output : Codomain) : LRA.Function Domain Codomain :=
  fun _ => output (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def constant {Domain : Type u} {Codomain : Type v}
    (output : Codomain) : LRA.Function Domain Codomain :=
  fun _ => output
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
def constant {Domain : Type u} {Codomain : Type v}
    (output : Codomain) : LRA.Function Domain Codomain :=
  fun _ => output

end LRA.Function.Examples
