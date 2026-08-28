import LRA.Function.Definition
import LRA.Relation.Interface.Operations.Restriction.Definition
import LRA.Set.SetClass.Definition

namespace LRA.Function

open LRA.Set
universe u v w

/--
`RestrictsTo` TODO

Predicate logic:

  ∀ {Subdomain : Type u} {Domain : Type v} {Codomain : Type w} (restricted : LRA.Function Subdomain Codomain) (original : LRA.Function Domain Codomain) (inclusion : LRA.Function Subdomain Domain) (input : Subdomain), restricted input = original (inclusion input)

Predicate logic (unfolded):

  ∀ {Subdomain : Type u} {Domain : Type v} {Codomain : Type w} (restricted : Subdomain → Codomain) (original : Domain → Codomain) (inclusion : Subdomain → Domain) (input : Subdomain), restricted input = original (inclusion input)

Logical form (Lean):

```lean
def RestrictsTo
    {Subdomain : Type u} {Domain : Type v} {Codomain : Type w}
    (restricted : LRA.Function Subdomain Codomain)
    (original : LRA.Function Domain Codomain)
    (inclusion : LRA.Function Subdomain Domain) : Prop :=
  ∀ input, restricted input = original (inclusion input)
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
def RestrictsTo
    {Subdomain : Type u} {Domain : Type v} {Codomain : Type w}
    (restricted : LRA.Function Subdomain Codomain)
    (original : LRA.Function Domain Codomain)
    (inclusion : LRA.Function Subdomain Domain) : Prop :=
  ∀ input, restricted input = original (inclusion input)

/--
`Restriction` TODO

Predicate logic:

  def Restriction
    {Subdomain : Type u} {Domain : Type v} {Codomain : Type w}
    (original : LRA.Function Domain Codomain)
    (inclusion : LRA.Function Subdomain Domain) :
    LRA.Function Subdomain Codomain :=
  fun input => original (inclusion input)

Predicate logic (unfolded):

  def Restriction
    {Subdomain : Type u} {Domain : Type v} {Codomain : Type w}
    (original : LRA.Function Domain Codomain)
    (inclusion : LRA.Function Subdomain Domain) :
    LRA.Function Subdomain Codomain :=
  fun input => original (inclusion input) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Restriction
    {Subdomain : Type u} {Domain : Type v} {Codomain : Type w}
    (original : LRA.Function Domain Codomain)
    (inclusion : LRA.Function Subdomain Domain) :
    LRA.Function Subdomain Codomain :=
  fun input => original (inclusion input)
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
def Restriction
    {Subdomain : Type u} {Domain : Type v} {Codomain : Type w}
    (original : LRA.Function Domain Codomain)
    (inclusion : LRA.Function Subdomain Domain) :
    LRA.Function Subdomain Codomain :=
  fun input => original (inclusion input)

/--
`Extends` TODO

Predicate logic:

  ∀ {SmallDomain : Type u} {LargeDomain : Type v} {Codomain : Type w} (extension : LRA.Function LargeDomain Codomain) (original : LRA.Function SmallDomain Codomain) (inclusion : LRA.Function SmallDomain LargeDomain) (input : SmallDomain), extension (inclusion input) = original input

Predicate logic (unfolded):

  ∀ {SmallDomain : Type u} {LargeDomain : Type v} {Codomain : Type w} (extension : LargeDomain → Codomain) (original : SmallDomain → Codomain) (inclusion : SmallDomain → LargeDomain) (input : SmallDomain), extension (inclusion input) = original input

Logical form (Lean):

```lean
def Extends
    {SmallDomain : Type u} {LargeDomain : Type v} {Codomain : Type w}
    (extension : LRA.Function LargeDomain Codomain)
    (original : LRA.Function SmallDomain Codomain)
    (inclusion : LRA.Function SmallDomain LargeDomain) : Prop :=
  ∀ input, extension (inclusion input) = original input
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
def Extends
    {SmallDomain : Type u} {LargeDomain : Type v} {Codomain : Type w}
    (extension : LRA.Function LargeDomain Codomain)
    (original : LRA.Function SmallDomain Codomain)
    (inclusion : LRA.Function SmallDomain LargeDomain) : Prop :=
  ∀ input, extension (inclusion input) = original input

/--
`RestrictDomainGraph` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (source : LRA.Set.SetClass Domain) (a : Domain) (a_1 : Codomain), (source a ∧ function.Graph a a_1)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (source : Domain → Prop) (a : Domain) (a_1 : Codomain), (source a ∧ function a = a_1)

Logical form (Lean):

```lean
abbrev RestrictDomainGraph {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) (source : SetClass Domain) :
    FunctionRelation Domain Codomain :=
  LRA.Relation.RestrictDomain (Graph function) source
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
abbrev RestrictDomainGraph {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) (source : SetClass Domain) :
    FunctionRelation Domain Codomain :=
  LRA.Relation.RestrictDomain (Graph function) source

/--
`RestrictCodomainGraph` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (target : LRA.Set.SetClass Codomain) (a : Domain) (a_1 : Codomain), (function.Graph a a_1 ∧ target a_1)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (target : Codomain → Prop) (a : Domain) (a_1 : Codomain), (function a = a_1 ∧ target a_1)

Logical form (Lean):

```lean
abbrev RestrictCodomainGraph {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) (target : SetClass Codomain) :
    FunctionRelation Domain Codomain :=
  LRA.Relation.RestrictCodomain (Graph function) target
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
abbrev RestrictCodomainGraph {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) (target : SetClass Codomain) :
    FunctionRelation Domain Codomain :=
  LRA.Relation.RestrictCodomain (Graph function) target

/--
`RestrictGraph` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (source : LRA.Set.SetClass Domain) (target : LRA.Set.SetClass Codomain) (a : Domain) (a_1 : Codomain), (source a ∧ (function.Graph a a_1 ∧ target a_1))

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (source : Domain → Prop) (target : Codomain → Prop) (a : Domain) (a_1 : Codomain), (source a ∧ (function a = a_1 ∧ target a_1))

Logical form (Lean):

```lean
abbrev RestrictGraph {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (source : SetClass Domain) (target : SetClass Codomain) :
    FunctionRelation Domain Codomain :=
  LRA.Relation.Restrict (Graph function) source target
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
abbrev RestrictGraph {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (source : SetClass Domain) (target : SetClass Codomain) :
    FunctionRelation Domain Codomain :=
  LRA.Relation.Restrict (Graph function) source target

end LRA.Function
