import LRA.Operation.Definition

namespace LRA.Operation.Laws.Closure

open LRA.Operation

universe u v w

def UnaryClosedUnder {Domain : Type u} {Codomain : Type v}
    (domainCarrier : Domain → Prop)
    (codomainCarrier : Codomain → Prop)
    (operation : HeterogeneousUnaryOperation Domain Codomain) : Prop :=
  ∀ input, domainCarrier input → codomainCarrier (operation input)

def BinaryClosedUnder {Left : Type u} {Right : Type v} {Codomain : Type w}
    (leftCarrier : Left → Prop)
    (rightCarrier : Right → Prop)
    (resultCarrier : Codomain → Prop)
    (operation : HeterogeneousBinaryOperation Left Right Codomain) : Prop :=
  ∀ left right,
    leftCarrier left → rightCarrier right → resultCarrier (operation left right)

def BinaryEndoClosedOn {Ambient : Type u}
    (carrier : Ambient → Prop)
    (operation : BinaryEndoOperation Ambient) : Prop :=
  BinaryClosedUnder carrier carrier carrier operation

end LRA.Operation.Laws.Closure
