import LRA.Operation.Definition

namespace LRA.Operation

universe u

/--
`NaryOperation` TODO

Predicate logic:

  abbrev NaryOperation (arity : Nat) (Alpha : Type u) :=
  (Fin arity → Alpha) → Alpha

Predicate logic (unfolded):

  abbrev NaryOperation (arity : Nat) (Alpha : Type u) :=
  (Fin arity → Alpha) → Alpha (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev NaryOperation (arity : Nat) (Alpha : Type u) :=
  (Fin arity → Alpha) → Alpha
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
abbrev NaryOperation (arity : Nat) (Alpha : Type u) :=
  (Fin arity → Alpha) → Alpha

/--
`NullaryAsNary` TODO

Predicate logic:

  def NullaryAsNary {Alpha : Type u}
    (constant : NullaryOperation Alpha) : NaryOperation 0 Alpha :=
  fun _ => constant

Predicate logic (unfolded):

  def NullaryAsNary {Alpha : Type u}
    (constant : NullaryOperation Alpha) : NaryOperation 0 Alpha :=
  fun _ => constant (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NullaryAsNary {Alpha : Type u}
    (constant : NullaryOperation Alpha) : NaryOperation 0 Alpha :=
  fun _ => constant
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
def NullaryAsNary {Alpha : Type u}
    (constant : NullaryOperation Alpha) : NaryOperation 0 Alpha :=
  fun _ => constant

/--
`UnaryAsNary` TODO

Predicate logic:

  def UnaryAsNary {Alpha : Type u}
    (operation : UnaryOperation Alpha) : NaryOperation 1 Alpha :=
  fun input => operation (input ⟨0, by decide⟩)

Predicate logic (unfolded):

  def UnaryAsNary {Alpha : Type u}
    (operation : UnaryOperation Alpha) : NaryOperation 1 Alpha :=
  fun input => operation (input ⟨0, by decide⟩) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def UnaryAsNary {Alpha : Type u}
    (operation : UnaryOperation Alpha) : NaryOperation 1 Alpha :=
  fun input => operation (input ⟨0, by decide⟩)
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
def UnaryAsNary {Alpha : Type u}
    (operation : UnaryOperation Alpha) : NaryOperation 1 Alpha :=
  fun input => operation (input ⟨0, by decide⟩)

/--
`BinaryAsNary` TODO

Predicate logic:

  def BinaryAsNary {Alpha : Type u}
    (operation : BinaryOperation Alpha) : NaryOperation 2 Alpha :=
  fun input => operation (input ⟨0, by decide⟩) (input ⟨1, by decide⟩)

Predicate logic (unfolded):

  def BinaryAsNary {Alpha : Type u}
    (operation : BinaryOperation Alpha) : NaryOperation 2 Alpha :=
  fun input => operation (input ⟨0, by decide⟩) (input ⟨1, by decide⟩) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BinaryAsNary {Alpha : Type u}
    (operation : BinaryOperation Alpha) : NaryOperation 2 Alpha :=
  fun input => operation (input ⟨0, by decide⟩) (input ⟨1, by decide⟩)
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
def BinaryAsNary {Alpha : Type u}
    (operation : BinaryOperation Alpha) : NaryOperation 2 Alpha :=
  fun input => operation (input ⟨0, by decide⟩) (input ⟨1, by decide⟩)

end LRA.Operation
