import LRA.Operation.Laws.Closure.Definition

namespace LRA.Operation.Laws.Closure

open LRA.Operation

universe u v w

theorem UnaryClosedUnder.apply {Domain : Type u} {Codomain : Type v}
    {domainCarrier : Domain → Prop}
    {codomainCarrier : Codomain → Prop}
    {operation : HeterogeneousUnaryOperation Domain Codomain}
    (law : UnaryClosedUnder domainCarrier codomainCarrier operation)
    {input : Domain}
    (input_mem : domainCarrier input) :
    codomainCarrier (operation input) := by
  sorry

theorem BinaryClosedUnder.apply {Left : Type u} {Right : Type v} {Codomain : Type w}
    {leftCarrier : Left → Prop}
    {rightCarrier : Right → Prop}
    {resultCarrier : Codomain → Prop}
    {operation : HeterogeneousBinaryOperation Left Right Codomain}
    (law : BinaryClosedUnder leftCarrier rightCarrier resultCarrier operation)
    {left : Left}
    {right : Right}
    (left_mem : leftCarrier left)
    (right_mem : rightCarrier right) :
    resultCarrier (operation left right) := by
  sorry

theorem BinaryEndoClosedOn.apply {Ambient : Type u}
    {carrier : Ambient → Prop}
    {operation : BinaryEndoOperation Ambient}
    (law : BinaryEndoClosedOn carrier operation)
    {left right : Ambient}
    (left_mem : carrier left)
    (right_mem : carrier right) :
    carrier (operation left right) := by
  sorry

theorem BinaryEndoOperation.closed_on_full_carrier {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) :
    BinaryEndoClosedOn (fun _ : Carrier => True) operation := by
  sorry

end LRA.Operation.Laws.Closure
