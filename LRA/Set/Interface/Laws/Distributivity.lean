namespace LRA.Set

universe u

/--
`DistributivityLaws` TODO

Predicate logic:

  class DistributivityLaws (α : Type u) [Union α] [Inter α] : Prop where
  IntersectionDistributesOverUnion :
    ∀ A B C : α, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)
  UnionDistributesOverIntersection :
    ∀ A B C : α, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)
  AbsorptionUnionIntersection : ∀ A B : α, A ∪ (A ∩ B) = A
  AbsorptionIntersectionUnion : ∀ A B : α, A ∩ (A ∪ B) = A

Predicate logic (unfolded):

  class DistributivityLaws (α : Type u) [Union α] [Inter α] : Prop where
  IntersectionDistributesOverUnion :
    ∀ A B C : α, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)
  UnionDistributesOverIntersection :
    ∀ A B C : α, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)
  AbsorptionUnionIntersection : ∀ A B : α, A ∪ (A ∩ B) = A
  AbsorptionIntersectionUnion : ∀ A B : α, A ∩ (A ∪ B) = A (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class DistributivityLaws (α : Type u) [Union α] [Inter α] : Prop where
  IntersectionDistributesOverUnion :
    ∀ A B C : α, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)
  UnionDistributesOverIntersection :
    ∀ A B C : α, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)
  AbsorptionUnionIntersection : ∀ A B : α, A ∪ (A ∩ B) = A
  AbsorptionIntersectionUnion : ∀ A B : α, A ∩ (A ∪ B) = A
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
class DistributivityLaws (α : Type u) [Union α] [Inter α] : Prop where
  IntersectionDistributesOverUnion :
    ∀ A B C : α, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)
  UnionDistributesOverIntersection :
    ∀ A B C : α, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)
  AbsorptionUnionIntersection : ∀ A B : α, A ∪ (A ∩ B) = A
  AbsorptionIntersectionUnion : ∀ A B : α, A ∩ (A ∪ B) = A

variable {α : Type u} [Union α] [Inter α] [DistributivityLaws α]

/--
`IntersectionDistributesOverUnion` TODO

Predicate logic:

  ∀ A B C : α, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : Union α] [inst_1 : Inter α], LRA.Set.DistributivityLaws α → ∀ (A B C : α), inst_1.1 A (inst.1 B C) = inst.1 (inst_1.1 A B) (inst_1.1 A C)

Logical form (Lean):

```lean
theorem IntersectionDistributesOverUnion :
    ∀ A B C : α, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)
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
theorem IntersectionDistributesOverUnion :
    ∀ A B C : α, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C) :=
  DistributivityLaws.IntersectionDistributesOverUnion

/--
`UnionDistributesOverIntersection` TODO

Predicate logic:

  ∀ A B C : α, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : Union α] [inst_1 : Inter α], LRA.Set.DistributivityLaws α → ∀ (A B C : α), inst.1 A (inst_1.1 B C) = inst_1.1 (inst.1 A B) (inst.1 A C)

Logical form (Lean):

```lean
theorem UnionDistributesOverIntersection :
    ∀ A B C : α, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)
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
theorem UnionDistributesOverIntersection :
    ∀ A B C : α, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C) :=
  DistributivityLaws.UnionDistributesOverIntersection

/--
`AbsorptionUnionIntersection` TODO

Predicate logic:

  ∀ A B : α, A ∪ (A ∩ B) = A

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : Union α] [inst_1 : Inter α], LRA.Set.DistributivityLaws α → ∀ (A B : α), inst.1 A (inst_1.1 A B) = A

Logical form (Lean):

```lean
theorem AbsorptionUnionIntersection : ∀ A B : α, A ∪ (A ∩ B) = A
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
theorem AbsorptionUnionIntersection : ∀ A B : α, A ∪ (A ∩ B) = A :=
  DistributivityLaws.AbsorptionUnionIntersection

/--
`AbsorptionIntersectionUnion` TODO

Predicate logic:

  ∀ A B : α, A ∩ (A ∪ B) = A

Predicate logic (unfolded):

  ∀ {α : Type u} [inst : Union α] [inst_1 : Inter α], LRA.Set.DistributivityLaws α → ∀ (A B : α), inst_1.1 A (inst.1 A B) = A

Logical form (Lean):

```lean
theorem AbsorptionIntersectionUnion : ∀ A B : α, A ∩ (A ∪ B) = A
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
theorem AbsorptionIntersectionUnion : ∀ A B : α, A ∩ (A ∪ B) = A :=
  DistributivityLaws.AbsorptionIntersectionUnion

end LRA.Set
