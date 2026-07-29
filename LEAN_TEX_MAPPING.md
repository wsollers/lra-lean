# LRA Lean Scratch — TeX Label ↔ Lean Name Mapping

Auto-generated cross-reference between every `def`/`theorem`/`structure`/`abbrev`
declared across the `*.lean` scratch files in this repo (all under `LRA/VolumeIII/Analysis/<Chapter>/Scratch/`,
none wired into the real project) and the book (`.tex`) label(s) each one ports.

- Chapters covered: Real Analysis (Ch.1), Bounds/Completeness (Ch.3-4), Structure of the
  Real Line (Ch.2), Functions (Ch.4*), Sequences (Ch.6), Continuity (Ch.9*),
  Differentiation (Ch.10*), Integration (Ch.11*).
- `← def:...` / `← thm:...` / `← lem:...` / `← cor:...` / `← prop:...` / `← ex:...` is the
  book's own `\label{...}` this Lean declaration was built from, extracted from each
  declaration's leading doc comment (`/-- ... -/`). Where a doc comment cites two labels,
  the Lean declaration ports/relates both (e.g. an equivalence, or a bridge theorem).
- *(no book label found)* means the declaration is Lean-side scaffolding — an auxiliary
  predicate, helper definition, or structure introduced to make the ported statements
  type-check, not a direct 1:1 port of a labeled book node. Not a gap to worry about.
- All bodies are `sorry` — this file maps *statements*, not completed proofs.
- Generated 2026-07-28. Not yet cross-checked against a `lake build`.

---

## Bounding

### `Bounding/Scratch/AlgebraOfSupremumInfimum.lean`
- **def `Reciprocal`** ← `def:reciprocal-image`
- **theorem `translation_invariance_supremum`** ← `thm:translation-invariance-supremum`
- **theorem `translation_invariance_infimum`** ← `thm:translation-invariance-infimum`
- **theorem `scalar_mult_positive`** ← `thm:scalar-mult-positive`
- **theorem `positive_scalar_mult_infimum`** ← `thm:positive-scalar-mult-infimum`
- **theorem `scalar_mult_negative`** ← `thm:scalar-mult-negative`
- **theorem `negative_scalar_mult_infimum`** ← `thm:negative-scalar-mult-infimum`
- **theorem `negation_exchange_sup_inf`** ← `thm:negation-exchange-sup-inf`
- **theorem `supremum_sum_set`** ← `thm:supremum-sum-set`
- **theorem `infimum_sum_set`** ← `thm:infimum-sum-set`
- **theorem `supremum_difference_set`** ← `thm:supremum-difference-set`
- **theorem `infimum_difference_set`** ← `thm:infimum-difference-set`
- **theorem `supremum_dilation`** ← `thm:supremum-dilation`
- **theorem `supremum_absolute_value_image`** ← `thm:supremum-absolute-value-image`
- **theorem `supremum_reciprocal_set`** ← `thm:supremum-reciprocal-set`, `def:reciprocal-image`
- **theorem `infimum_reciprocal_set`** ← `thm:infimum-reciprocal-set`
- **theorem `supremum_product_set`** ← `thm:supremum-product-set`
- **theorem `infimum_product_set`** ← `thm:infimum-product-set`
- **theorem `supremum_quotient_set`** ← `thm:supremum-quotient-set`
- **theorem `infimum_quotient_set`** ← `thm:infimum-quotient-set`
- **theorem `bounds_sum_set_upper`** ← `prop:bounds-sum-set`
- **theorem `bounds_sum_set_lower`** ← `prop:bounds-sum-set`
- **theorem `upper_bounds_ambient_order`** ← `prop:upper-bounds-ambient-order`
- **theorem `suprema_ambient_set`** ← `prop:suprema-ambient-set`
- **theorem `ambient_existence_supremum`** ← `thm:ambient-existence-supremum`
- **theorem `rational_gap_suprema`** ← `lem:rational-gap-suprema`

### `Bounding/Scratch/ArchimedeanProperty.lean`
- **theorem `archimedean_property`** ← `thm:archimedean-property`
- **theorem `archimedean_reciprocal_form`** ← `cor:archimedean-reciprocal-form`
- **theorem `archimedean_reciprocal`** ← `cor:archimedean-reciprocal`
- **theorem `integer_part_lemma`** ← `lem:integer-part-lemma`
- **theorem `archimedean_integer_part_lemma`** ← `lem:archimedean-integer-part-lemma`
- **theorem `integer_ceiling_lemma`** ← `lem:integer-ceiling-lemma`
- **theorem `integer_above_lemma`** ← `lem:integer-above-lemma`
- **theorem `unit_length_interval_contains_integer`** ← `lem:unit-length-interval-contains-integer`
- **theorem `naturals_unbounded_above`** ← `thm:archimedean-property`, `thm:archimedean-property`

### `Bounding/Scratch/AxiomOfCompleteness.lean`
- **def `HasLeastUpperBoundProperty`** ← `def:least-upper-bound-property`
- **theorem `completeness_of_reals`** ← *(no book label found)*

### `Bounding/Scratch/BoundAlgebra.lean`
- **def `Displace`** ← `def:displacement-dilation-reflection`
- **def `Dilate`** ← `def:displacement-dilation-reflection`
- **def `Reflect`** ← `def:displacement-dilation-reflection`
- **theorem `translation_preserves_upper_bounds`** ← `prop:translation-preserves-upper-bounds`
- **theorem `translation_preserves_lower_bounds`** ← `prop:translation-preserves-lower-bounds`
- **theorem `positive_dilation_preserves_upper_bounds`** ← `prop:positive-dilation-preserves-upper-bounds`
- **theorem `positive_dilation_preserves_lower_bounds`** ← `prop:positive-dilation-preserves-lower-bounds`
- **theorem `negative_dilation_sends_lower_to_upper_bounds`** ← `prop:negative-dilation-sends-lower-to-upper-bounds`
- **theorem `negative_dilation_sends_upper_to_lower_bounds`** ← `prop:negative-dilation-sends-upper-to-lower-bounds`
- **theorem `reflection_swaps_upper_lower_bounds_upper`** ← `cor:reflection-swaps-upper-lower-bounds`
- **theorem `reflection_swaps_upper_lower_bounds_lower`** ← `cor:reflection-swaps-upper-lower-bounds`

### `Bounding/Scratch/CompletenessEquivalences.lean`
- **def `HasGreatestLowerBoundProperty`** ← `def:greatest-lower-bound-property`
- **def `IncreasingBoundedSequencesConverge`** ← *(no book label found)*
- **def `DecreasingBoundedSequencesConverge`** ← *(no book label found)*
- **def `NestedIntervalProperty`** ← `def:nested-interval-property`
- **def `CauchySequencesConverge`** ← *(no book label found)*
- **def `BolzanoWeierstrassProperty`** ← *(no book label found)*
- **theorem `lub_property_implies_increasing_convergence`** ← `thm:lub-property-implies-monotone-convergence`
- **theorem `lub_property_implies_decreasing_convergence`** ← `thm:lub-property-implies-monotone-convergence`
- **theorem `monotone_convergence_implies_lub_property`** ← `thm:monotone-convergence-implies-lub-property`
- **theorem `lub_property_equivalent_monotone_convergence`** ← `thm:lub-property-equivalent-monotone-convergence`
- **theorem `lub_property_equivalent_nested_interval_property`** ← `thm:lub-property-equivalent-nested-interval-property`
- **theorem `standard_completeness_equivalences`** ← `thm:standard-completeness-equivalences`, `thm:monotone-convergence-theorem`, `thm:nested-interval-theorem`, `thm:bolzano-weierstrass-sequences`, `thm:cauchy-criterion-real-sequences`

### `Bounding/Scratch/Density.lean`
- **def `IsOrderDenseSubset`** ← `def:order-dense-subset`
- **def `IsRat`** ← *(no book label found)*
- **theorem `density_of_rationals_in_reals`** ← `thm:density-of-rationals-in-reals`
- **theorem `rational_translation_preserves_rationality`** ← `lem:rational-translation-preserves-rationality`
- **theorem `rational_difference_preserves_rationality`** ← `lem:rational-difference-preserves-rationality`
- **theorem `nonzero_rational_product_preserves_irrationality`** ← `lem:nonzero-rational-product-preserves-irrationality`
- **theorem `rational_translation_preserves_irrationality`** ← `lem:rational-translation-preserves-irrationality`
- **theorem `irrational_minus_irrational_need_not_be_irrational`** ← `lem:irrational-minus-irrational-need-not-be-irrational`
- **theorem `rational_minus_irrational_is_irrational`** ← `lem:rational-minus-irrational-is-irrational`
- **theorem `irrational_plus_rational_is_irrational`** ← `lem:irrational-plus-rational-is-irrational`
- **theorem `irrational_minus_rational_is_irrational`** ← `lem:irrational-minus-rational-is-irrational`
- **theorem `density_of_irrationals_in_reals`** ← `thm:density-of-irrationals-in-reals`
- **theorem `irrational_between_any_two_rationals`** ← `thm:irrational-between-any-two-rationals`
- **theorem `rational_between_any_two_irrationals`** ← `thm:rational-between-any-two-irrationals`
- **theorem `small_irrational_positive_number`** ← `lem:small-irrational-positive-number`
- **theorem `no_adjacent_real_numbers`** ← `cor:no-adjacent-real-numbers`
- **theorem `no_immediate_successors_in_r`** ← `thm:no-immediate-successors-in-r`
- **theorem `no_immediate_predecessors_in_r`** ← `thm:no-immediate-predecessors-in-r`
- **theorem `every_open_interval_contains_rational_and_irrational`** ← `cor:every-open-interval-contains-rational-and-irrational`
- **theorem `infinitely_many_rationals_and_irrationals_in_open_interval`** ← `thm:density-of-irrationals-in-reals`

### `Bounding/Scratch/EpsilonCharacterization.lean`
- **theorem `epsilon_characterization_of_supremum`** ← `def:epsilon-characterization-of-supremum`
- **theorem `epsilon_characterization_of_infimum`** ← `def:epsilon-characterization-of-infimum`
- **theorem `supremum_strict_upper_approximation`** ← `lem:supremum-strict-upper-approximation`
- **theorem `infimum_strict_lower_approximation`** ← `lem:infimum-strict-lower-approximation`

### `Bounding/Scratch/ImageInverseExtrema.lean`
- **theorem `increasing_image_preserves_suprema`** ← `thm:increasing-image-preserves-suprema`
- **theorem `increasing_image_preserves_infima`** ← `thm:increasing-image-preserves-infima`
- **theorem `decreasing_image_infimum_to_supremum`** ← `thm:decreasing-image-infimum-to-supremum`
- **theorem `decreasing_image_supremum_to_infimum`** ← `thm:decreasing-image-supremum-to-infimum`
- **theorem `increasing_inverse_preserves_suprema`** ← `thm:increasing-inverse-preserves-suprema`
- **theorem `increasing_inverse_preserves_infima`** ← `thm:increasing-inverse-preserves-infima`
- **theorem `decreasing_inverse_infimum_to_supremum`** ← `thm:decreasing-inverse-infimum-to-supremum`
- **theorem `decreasing_inverse_supremum_to_infimum`** ← `thm:decreasing-inverse-supremum-to-infimum`

### `Bounding/Scratch/LatticeOperationsAndBounds.lean`
- **def `PairwiseMax`** ← `def:pairwise-maximum-minimum-sets`
- **def `PairwiseMin`** ← `def:pairwise-maximum-minimum-sets`
- **theorem `supremum_pairwise_maximum_set`** ← `thm:supremum-pairwise-maximum-set`
- **theorem `infimum_pairwise_maximum_set`** ← `thm:infimum-pairwise-maximum-set`
- **theorem `supremum_pairwise_minimum_set`** ← `thm:supremum-pairwise-minimum-set`
- **theorem `infimum_pairwise_minimum_set`** ← `thm:infimum-pairwise-minimum-set`

### `Bounding/Scratch/MaximaMinima.lean`
- **def `IsMaximum`** ← `def:maximum`
- **def `IsMinimum`** ← `def:minimum`
- **theorem `uniqueness_of_the_maximum`** ← `prop:uniqueness-of-the-maximum`
- **theorem `uniqueness_of_the_minimum`** ← `prop:uniqueness-of-the-minimum`
- **theorem `maximum_implies_supremum`** ← `prop:maximum-implies-supremum`
- **theorem `minimum_implies_infimum`** ← `prop:minimum-implies-infimum`
- **theorem `supremum_in_the_set_is_the_maximum`** ← `prop:supremum-in-the-set-is-the-maximum`
- **theorem `infimum_in_the_set_is_the_minimum`** ← `prop:infimum-in-the-set-is-the-minimum`
- **theorem `maximum_iff_supremum_mem`** ← `cor:maximum-iff-supremum-in-the-set`

### `Bounding/Scratch/NestedIntervalProperty.lean`
- **structure `in`** ← *(no book label found)*
- **def `IsNestedClosedIntervalFamily`** ← *(no book label found)*
- **theorem `nested_closed_intervals_have_ordered_endpoints`** ← `lem:nested-closed-intervals-have-ordered-endpoints`
- **theorem `left_endpoints_nested_intervals_increasing`** ← `lem:left-endpoints-nested-intervals-increasing`
- **theorem `right_endpoints_nested_intervals_decreasing`** ← `lem:right-endpoints-nested-intervals-decreasing`
- **theorem `left_endpoints_bounded_above_by_right_endpoints`** ← `lem:left-endpoints-bounded-above-by-right-endpoints`
- **theorem `endpoint_supremum_infimum_inequality`** ← `lem:endpoint-supremum-infimum-inequality`
- **theorem `nested_interval_theorem`** ← `thm:nested-interval-theorem`
- **theorem `nested_interval_intersection_contains_endpoint_supremum`** ← `cor:nested-interval-intersection-contains-endpoint-supremum`
- **theorem `nested_interval_intersection_contains_endpoint_infimum`** ← `cor:nested-interval-intersection-contains-endpoint-infimum`
- **theorem `nested_intervals_vanishing_length_have_unique_point`** ← `cor:nested-intervals-vanishing-length-have-unique-point`
- **theorem `nested_intervals_vanishing_length_have_equal_endpoint_limits`** ← `cor:nested-intervals-vanishing-length-have-equal-endpoint-limits`
- **theorem `unique_point_in_nested_intervals_is_endpoint_limit`** ← `cor:unique-point-in-nested-intervals-is-endpoint-limit`
- **theorem `open_nested_intervals_need_not_have_nonempty_intersection`** ← `prop:open-nested-intervals-need-not-have-nonempty-intersection`
- **theorem `closedness_is_necessary_in_nested_interval_theorem`** ← `prop:closedness-is-necessary-in-nested-interval-theorem`
- **theorem `boundedness_is_necessary_in_nested_interval_theorem`** ← `prop:boundedness-is-necessary-in-nested-interval-theorem`

### `Bounding/Scratch/OrderSeparation.lean`
- **theorem `order_separation_by_supremum`** ← `thm:order-separation-by-supremum`
- **theorem `sup_le_inf_of_order_separated`** ← `thm:order-separation-by-supremum`
- **theorem `dedekind_cut_property`** ← `thm:dedekind-cut-property`
- **theorem `no_gaps_in_r`** ← `cor:no-gaps-in-r`

### `Bounding/Scratch/RelativeBounds.lean`
- **def `IsRelativeUpperBound`** ← `def:relative-bounds`
- **def `IsRelativeLowerBound`** ← `def:relative-bounds`
- **def `IsRelativeSupremum`** ← `def:relative-supremum-infimum`
- **def `IsRelativeInfimum`** ← `def:relative-supremum-infimum`
- **theorem `ordinary_supremum_in_S_is_relative_supremum`** ← `def:supremum`
- **theorem `ordinary_infimum_in_S_is_relative_infimum`** ← *(no book label found)*
- **def `RationalsWithSquareLessThanTwoInR`** ← *(no book label found)*
- **theorem `no_relative_supremum_of_rationals_example`** ← *(no book label found)*
- **theorem `relative_supremum_of_rationals_in_R_example`** ← *(no book label found)*

### `Bounding/Scratch/SetOperationsAndBounds.lean`
- **theorem `union_preserves_upper_bounds`** ← `lem:union-preserves-upper-bounds`
- **theorem `union_preserves_lower_bounds`** ← `lem:union-preserves-lower-bounds`
- **theorem `union_bounded_above_iff_pieces_bounded_above`** ← `prop:union-bounded-above-iff-pieces-bounded-above`
- **theorem `union_bounded_below_iff_pieces_bounded_below`** ← `prop:union-bounded-below-iff-pieces-bounded-below`
- **theorem `union_bounded_iff_pieces_bounded`** ← `cor:union-bounded-iff-pieces-bounded`
- **theorem `subsets_preserve_upper_bounds`** ← `lem:subsets-preserve-upper-bounds`
- **theorem `subsets_preserve_lower_bounds`** ← `lem:subsets-preserve-lower-bounds`
- **theorem `intersections_inherit_upper_bounds`** ← `cor:intersections-inherit-bounds`
- **theorem `intersections_inherit_lower_bounds`** ← `cor:intersections-inherit-bounds`
- **theorem `differences_inherit_upper_bounds`** ← `cor:differences-inherit-bounds`
- **theorem `differences_inherit_lower_bounds`** ← `cor:differences-inherit-bounds`
- **theorem `complements_inherit_upper_bounds`** ← `cor:complements-inherit-ambient-bounds`
- **theorem `complements_inherit_lower_bounds`** ← `cor:complements-inherit-ambient-bounds`

### `Bounding/Scratch/SupremaInfima.lean`
- **def `IsSupremum`** ← `def:supremum`
- **def `IsInfimum`** ← `def:infimum`
- **theorem `uniqueness_of_the_supremum`** ← `prop:uniqueness-of-the-supremum`
- **theorem `uniqueness_of_the_infimum`** ← `prop:uniqueness-of-the-infimum`
- **theorem `upper_bound_property_of_supremum`** ← `prop:upper-bound-property-of-supremum`
- **theorem `lower_bound_property_of_infimum`** ← `prop:lower-bound-property-of-infimum`
- **theorem `subset_inclusion_preserves_upper_bounds`** ← `lem:subset-inclusion-preserves-upper-bounds`
- **theorem `subset_inclusion_preserves_lower_bounds`** ← `lem:subset-inclusion-preserves-lower-bounds`
- **theorem `supremum_monotone_under_inclusion`** ← `thm:supremum-is-monotone-under-inclusion`
- **theorem `infimum_antitone_under_inclusion`** ← `thm:infimum-is-monotone-under-inclusion`
- **theorem `upper_bound_comparison_with_the_supremum`** ← `prop:upper-bound-comparison-with-the-supremum`
- **theorem `lower_bound_comparison_with_the_infimum`** ← `prop:lower-bound-comparison-with-the-infimum`
- **theorem `every_element_lies_below_the_supremum`** ← `prop:every-element-lies-below-the-supremum`
- **theorem `every_element_lies_above_the_infimum`** ← `prop:every-element-lies-above-the-infimum`
- **theorem `infimum_le_supremum`** ← `thm:infimum-less-than-supremum`
- **theorem `supremum_need_not_belong_to_the_set`** ← `prop:supremum-need-not-belong-to-the-set`
- **theorem `infimum_need_not_belong_to_the_set`** ← `prop:infimum-need-not-belong-to-the-set`
- **theorem `order_comparison_of_suprema`** ← `prop:order-comparison-of-suprema`
- **theorem `lub_property_implies_existence_of_suprema`** ← `thm:lub-property-implies-existence-of-suprema`
- **theorem `glb_property_implies_existence_of_infima`** ← `thm:glb-property-implies-existence-of-infima`
- **theorem `bounded_set_has_supremum_and_infimum`** ← `cor:bounded-set-has-supremum-and-infimum`

### `Bounding/Scratch/UpperLowerBounds.lean`
- **def `IsBound`** ← `def:bound`
- **def `IsUpperBoundOf`** ← `def:real-upper-bound`
- **def `IsLowerBoundOf`** ← `def:real-lower-bound`
- **def `IsBoundedAbove`** ← `def:bounded-above`
- **def `IsBoundedBelow`** ← `def:bounded-below`
- **def `IsBounded`** ← `def:bounded`, `prop:bounded-iff-absolute-value-bound`
- **theorem `IsBounded_iff_abs_bound`** ← `prop:bounded-iff-absolute-value-bound`

## Completeness

### `Completeness/Scratch/CompletenessAdditions.lean`
- **theorem `exists_unique_nonneg_sqrt`** ← *(no book label found)*
- **theorem `rationals_lack_lub_property`** ← *(no book label found)*
- **def `RationalCutLowerAtSqrtTwo`** ← `def:relative-bounds`
- **def `RationalCutUpperAtSqrtTwo`** ← *(no book label found)*
- **theorem `rational_dedekind_cut_at_sqrt_two_has_a_gap`** ← `thm:dedekind-cut-property`, `cor:no-gaps-in-r`
- **def `RealCutLowerAtSqrtTwo`** ← *(no book label found)*
- **def `RealCutUpperAtSqrtTwo`** ← *(no book label found)*
- **theorem `real_dedekind_cut_at_sqrt_two_has_no_gap`** ← `thm:dedekind-cut-property`
- **theorem `bisection_steps_toward_sqrt_two`** ← `thm:monotone-convergence-implies-lub-property`

## Continuity

### `Continuity/Scratch/Approximation.lean`
- **def `IsStepFunction`** ← *(no book label found)*
- **theorem `step_function_approximation`** ← `thm:step-function-approximation`
- **def `IsPiecewiseLinear`** ← `def:piecewise-linear-function`
- **theorem `piecewise_linear_approximation`** ← `thm:piecewise-linear-approximation`
- **theorem `weierstrass_approximation`** ← `thm:weierstrass-approximation`
- **def `BernsteinPolynomial`** ← `def:bernstein-polynomial`
- **theorem `bernstein_approximation`** ← `thm:bernstein-approximation`

### `Continuity/Scratch/Gauge.lean`
- **structure `IntervalPartition`** ← `def:interval-partition`
- **structure `TaggedPartition`** ← `def:tagged-partition`
- **def `IsGauge`** ← `def:gauge`
- **def `IsDeltaFine`** ← `def:delta-fine-partition`
- **theorem `cousins_theorem`** ← `thm:cousins-theorem`
- **def `MeshOf`** ← `def:mesh-of-partition`
- **def `IsRefinementOf`** ← `def:refinement-of-partition`
- **def `HasCommonRefinement`** ← `def:common-refinement`
- **theorem `common_refinement_exists`** ← *(no book label found)*
- **theorem `every_point_covered_by_tag`** ← `lem:every-point-covered-by-tag`

### `Continuity/Scratch/GlobalTheorems.lean`
- **def `ContinuousOn'`** ← *(no book label found)*
- **def `BoundedOnSet`** ← `def:bounded-on-a-set`
- **theorem `boundedness_theorem`** ← `thm:boundedness-theorem`
- **def `IsAbsoluteMaximum`** ← `def:absolute-extrema`
- **def `IsAbsoluteMinimum`** ← *(no book label found)*
- **theorem `extreme_value_theorem`** ← `thm:extreme-value-theorem`
- **theorem `location_of_roots`** ← `thm:location-of-roots`
- **theorem `bolzano_intermediate_value`** ← `thm:bolzano-intermediate-value`
- **theorem `preservation_of_intervals`** ← `thm:preservation-of-intervals`
- **def `DarbouxProperty`** ← `thm:darboux-property`, `thm:darboux`
- **theorem `continuous_implies_darboux_property`** ← *(no book label found)*
- **theorem `heine_cantor`** ← `thm:heine-cantor`, `def:uniform-continuity`
- **theorem `image_of_closed_bounded_interval`** ← `thm:image-of-closed-bounded-interval`

### `Continuity/Scratch/Limits.lean`
- **def `TendsTo`** ← `def:limit-function`
- **theorem `tendsto_unique`** ← `thm:limit-unique`
- **def `TendsToRight`** ← `def:right-hand-limit`
- **def `TendsToLeft`** ← `def:left-hand-limit`
- **theorem `tendsto_iff_one_sided_agree`** ← `thm:two-sided-limit-iff-matching-one-sided-limits`
- **theorem `tendsto_add`** ← `thm:limit-sum`
- **theorem `tendsto_sub`** ← `thm:limit-sum`
- **theorem `tendsto_scalar`** ← `thm:limit-scalar-multiple`
- **theorem `tendsto_mul`** ← `thm:limit-product`
- **theorem `tendsto_div`** ← `thm:limit-quotient`
- **theorem `squeeze_function_limits`** ← `thm:squeeze-function-limits`
- **def `ApproachesButNotEqual`** ← `prop:sequential-criterion-limits`
- **theorem `sequential_criterion_tendsto`** ← *(no book label found)*
- **theorem `tendsto_comp`** ← `thm:composition-of-limits`

### `Continuity/Scratch/LimitsAtInfinityAdditions.lean`
- **def `TendsToInfty`** ← `def:limit-at-infinity`
- **def `TendsToNegInfty`** ← `def:limit-at-infinity`
- **theorem `limit_at_neg_infinity_iff_reflection`** ← *(no book label found)*
- **theorem `tendsto_infty_add`** ← *(no book label found)*
- **theorem `tendsto_infty_sub`** ← *(no book label found)*
- **theorem `tendsto_infty_scalar`** ← *(no book label found)*
- **theorem `tendsto_infty_mul`** ← *(no book label found)*
- **theorem `tendsto_infty_div`** ← *(no book label found)*
- **def `EscapesToInfty`** ← *(no book label found)*
- **theorem `sequential_criterion_tendsto_infty`** ← *(no book label found)*

### `Continuity/Scratch/LimitsAtInfinityBase.lean`
- **def `PlusInftyAdherent`** ← `def:infinite-adherent-points`
- **def `MinusInftyAdherent`** ← *(no book label found)*

### `Continuity/Scratch/MonotoneFunctions.lean`
- **theorem `monotone_has_one_sided_limits`** ← `thm:monotone-one-sided-limits`
- **theorem `monotone_continuous_iff_one_sided_limits_agree`** ← `cor:monotone-continuity-criterion`
- **def `JumpOf`** ← `def:jump-of-function`
- **theorem `monotone_discontinuities_are_jumps`** ← `prop:monotone-discontinuities-first-kind`
- **theorem `jump_intervals_disjoint`** ← `cor:jump-intervals-for-monotone-discontinuities`
- **theorem `monotone_discontinuities_countable`** ← `thm:monotone-discontinuities-countable`
- **theorem `continuous_injective_iff_strictMono`** ← `prop:continuous-injective-iff-strictly-monotone`
- **theorem `continuous_inverse_theorem`** ← `thm:continuous-inverse-theorem`
- **def `LimsupAt`** ← `def:limsup-liminf-function`
- **def `LiminfAt`** ← *(no book label found)*
- **theorem `tendsto_iff_limsup_eq_liminf`** ← `prop:limsup-liminf-limit-criterion`
- **theorem `liminf_le_limsup`** ← `prop:limsup-geq-liminf-function`

### `Continuity/Scratch/PointContinuity.lean`
- **def `RelativeNeighborhood`** ← `def:relative-neighborhood`
- **def `ContinuousAtPoint`** ← `def:continuous-at-point`
- **def `ContinuousAtPointNbhd`** ← `def:continuous-at-point-nbhd`
- **theorem `continuousAtPoint_iff_nbhd`** ← *(no book label found)*
- **def `ContinuousAtPointSeq`** ← `def:continuous-at-point-seq`
- **theorem `continuousAtPoint_iff_seq`** ← *(no book label found)*
- **def `PointOfDiscontinuity`** ← `def:point-of-discontinuity`
- **def `SequentialDiscontinuity`** ← `def:sequential-discontinuity-at-a-point`
- **theorem `discontinuity_iff_sequential`** ← *(no book label found)*
- **def `NeighborhoodDiscontinuity`** ← `def:neighborhood-discontinuity-at-a-point`
- **theorem `discontinuity_iff_neighborhood`** ← *(no book label found)*
- **def `IsRemovableDiscontinuity`** ← *(no book label found)*
- **def `IsJumpDiscontinuity`** ← *(no book label found)*
- **def `IsEssentialDiscontinuity`** ← `def:types-of-discontinuity-at-a-point`
- **theorem `jump_subset_essential`** ← *(no book label found)*
- **def `OscillationOnSet`** ← `def:oscillation-on-a-set`
- **def `OscillationAtPoint`** ← `def:oscillation-at-a-point`
- **theorem `continuousAtPoint_iff_zero_oscillation`** ← `thm:continuity-iff-zero-oscillation`
- **theorem `discontinuity_set_eq_union_oscillation_bounded`** ← `prop:discontinuity-set-via-oscillation`

### `Continuity/Scratch/UniformContinuity.lean`
- **def `IsUniformlyContinuous`** ← `def:uniform-continuity`
- **theorem `uc_add`** ← `thm:algebra-of-uniform-continuity-bounded`
- **theorem `uc_mul_of_bounded`** ← *(no book label found)*
- **theorem `uc_comp`** ← `thm:algebra-of-uniform-continuity-general`
- **theorem `uc_iff_sequential`** ← `prop:sequential-uniform-continuity`
- **theorem `uc_maps_cauchy_to_cauchy`** ← `prop:uniform-continuity-cauchy`
- **def `IsLipschitzOn`** ← `def:lipschitz-condition`
- **theorem `lipschitz_implies_uc`** ← *(no book label found)*
- **def `IsBiLipschitzOn`** ← `def:bi-lipschitz`
- **theorem `biLipschitz_inverse_is_lipschitz`** ← `thm:bilipschitz-inverse-is-lipschitz`
- **theorem `sqrt_uc_not_lipschitz`** ← `prop:lipschitz-implies-uc`

## Differentiation

### `Differentiation/Scratch/AlgebraOfDerivatives.lean`
- **theorem `constant_multiple_rule`** ← `thm:constant-multiple-rule`
- **theorem `sum_rule`** ← `thm:sum-rule`
- **theorem `product_rule`** ← `thm:product-rule`
- **theorem `quotient_rule`** ← `thm:quotient-rule`
- **theorem `finite_sum_rule`** ← `cor:finite-sum-rule`
- **theorem `extended_product_rule`** ← `cor:extended-product-rule`
- **theorem `power_rule_special_case`** ← `cor:power-rule-special-case`
- **theorem `finite_linear_combination_rule`** ← `thm:finite-linear-combination-rule`
- **theorem `interval_forms_of_algebra_rules`** ← `thm:constant-multiple-rule-interval`, `thm:finite-linear-combination-rule-interval`
- **theorem `inverse_function_theorem_one_variable`** ← `thm:inverse-function-theorem-one-variable`
- **theorem `inverse_function_derivative`** ← `cor:inverse-function-derivative`
- **theorem `lhopital_zero_over_zero`** ← `thm:lhopital-zero-over-zero`
- **theorem `lhopital_infinity_over_infinity`** ← `thm:lhopital-infinity-over-infinity`

### `Differentiation/Scratch/ChainRule.lean`
- **theorem `caratheodory_characterization`** ← `thm:caratheodory-characterization-of-differentiability`
- **theorem `chain_rule`** ← `thm:chain-rule`
- **def `NthDerivativeAt`** ← `def:higher-derivatives`
- **theorem `leibniz_rule`** ← `thm:leibniz-rule`
- **theorem `faa_di_bruno_second_order`** ← *(no book label found)*

### `Differentiation/Scratch/DerivativeDefinition.lean`
- **def `Derivative`** ← `def:derivative-at-a-point`
- **def `IsDifferentiable`** ← *(no book label found)*
- **def `DerivativeTop`** ← `def:topological-definition-of-derivative-at-a-point`
- **def `DerivativeSeq`** ← `def:sequential-definition-of-derivative-at-a-point`
- **theorem `derivative_equivalence`** ← `thm:derivative-equivalence`
- **theorem `derivative_h_form_equivalence`** ← `prop:derivative-h-form-equivalence`
- **theorem `differentiable_implies_continuous`** ← `thm:differentiable-implies-continuous`
- **theorem `derivative_unique`** ← `thm:uniqueness-of-the-derivative`

### `Differentiation/Scratch/DerivativeGeometry.lean`
- **def `IsRelativeMinimum`** ← `def:relative-minimum`
- **def `IsRelativeMaximum`** ← `def:relative-maximum`
- **theorem `necessary_condition_extremum`** ← `thm:necessary-condition-extremum`
- **theorem `relative_extremum_necessary_condition`** ← `cor:relative-extremum-necessary-condition`, `thm:necessary-condition-extremum`
- **def `IsConvexOn`** ← `def:convex-function`
- **def `IsConcaveOn`** ← `def:concave-function`
- **def `IsInflection`** ← `def:inflection-point`

### `Differentiation/Scratch/GraphReading.lean`
- **def `IsIncreasingAt`** ← `def:increasing-at-a-point`
- **def `IsDecreasingAt`** ← `def:decreasing-at-a-point`
- **def `OrderReversing`** ← *(no book label found)*
- **theorem `nonincreasing_iff_nonpos_derivative`** ← `thm:nonincreasing-iff-nonpos-derivative`
- **theorem `zero_derivative_implies_constant`** ← `thm:zero-derivative-implies-constant`
- **theorem `equal_derivatives_constant_difference`** ← `cor:equal-derivatives-constant-difference`
- **theorem `first_derivative_test_maximum`** ← `thm:first-derivative-test-maximum`
- **theorem `first_derivative_test_minimum`** ← `thm:first-derivative-test-minimum`
- **def `SecondDerivative`** ← `def:second-derivative`
- **def `HigherDerivativeAt`** ← `def:higher-derivatives`
- **theorem `second_derivative_convexity_test`** ← `thm:second-derivative-convexity-test`
- **theorem `second_derivative_concavity_test`** ← `thm:second-derivative-concavity-test`
- **theorem `second_derivative_test`** ← `thm:second-derivative-test`
- **theorem `inflection_point_necessary_condition`** ← `prop:inflection-point-necessary-condition`
- **theorem `darboux`** ← `thm:darboux`
- **def `IsClassC1`** ← `def:class-c1`
- **def `IsClassCk`** ← `def:class-ck`
- **def `IsClassCInfty`** ← `def:class-cinfty`
- **def `IsClassCOmega`** ← `def:class-comega`
- **theorem `smoothness_tower`** ← `thm:smoothness-tower`
- **def `IsClassC11`** ← `def:class-c11`
- **theorem `c11_placement`** ← `thm:c11-placement`
- **theorem `bounded_second_derivative_implies_c11`** ← `cor:bounded-second-derivative-implies-c11`

### `Differentiation/Scratch/LinearApproximation.lean`
- **def `HasLinearApproximation`** ← `def:first-order-approximation-at-a-point`
- **theorem `differentiable_iff_has_linear_approximation`** ← `def:differentiability-linear-approximation`
- **theorem `linear_approximation_slope_eq_derivative`** ← *(no book label found)*

### `Differentiation/Scratch/MeanValueTheorem.lean`
- **theorem `rolles_theorem`** ← `thm:rolles-theorem`
- **theorem `mean_value_theorem`** ← `thm:mean-value-theorem`
- **theorem `cauchy_mean_value_theorem`** ← `thm:cauchy-mean-value-theorem`
- **theorem `nondecreasing_iff_nonneg_derivative`** ← `thm:nondecreasing-iff-nonneg-derivative`
- **theorem `derivative_bound_implies_lipschitz`** ← `cor:derivative-bound-implies-lipschitz`

### `Differentiation/Scratch/OneSidedDerivatives.lean`
- **def `LeftDerivative`** ← `def:left-hand-derivative`
- **def `RightDerivative`** ← `def:right-hand-derivative`
- **theorem `differentiable_iff_one_sided_derivatives_agree`** ← `thm:differentiability-and-one-sided-derivatives`

### `Differentiation/Scratch/SecantTangent.lean`
- **def `SecantLine`** ← `def:secant-line`
- **def `DifferenceQuotient`** ← `def:difference-quotient`
- **def `TangentLine`** ← `def:tangent-line`

### `Differentiation/Scratch/TaylorExpansion.lean`
- **def `TaylorPoly`** ← `def:taylor-polynomial-at-a-point`
- **def `TaylorRemainder`** ← `def:taylor-remainder`
- **def `MaclaurinPoly`** ← `def:maclaurin-polynomial`
- **theorem `taylor_theorem_lagrange_remainder`** ← `thm:taylor-theorem-lagrange-remainder`
- **theorem `taylor_expansion_peano_remainder`** ← `cor:taylor-expansion-peano-remainder`
- **theorem `first_order_peano_remainder`** ← `cor:first-order-peano-remainder`
- **def `FlatFunction`** ← `prop:flat-function`
- **theorem `flat_function_properties`** ← *(no book label found)*
- **def `DifferentiableByDifferential`** ← `def:differentiability-by-a-differential`
- **theorem `differential_and_derivative_agree`** ← `thm:differential-and-derivative-agree`
- **theorem `uniqueness_of_the_differential`** ← `thm:uniqueness-of-the-differential`
- **theorem `differential_continuity_criterion`** ← `thm:differential-continuity-criterion`
- **theorem `chain_rule_for_differentials`** ← `thm:chain-rule-for-differentials`
- **theorem `linearity_of_the_differential`** ← `thm:linearity-of-the-differential`

## Functions

### `Functions/Scratch/AlgebraOfFunctions.lean`
- **def `IsInjectiveOn`** ← *(no book label found)*
- **def `IsSurjectiveOn`** ← *(no book label found)*
- **def `IsBijectiveOn`** ← *(no book label found)*
- **def `IsInverseFunctionOf`** ← *(no book label found)*
- **theorem `composition_injective`** ← `prop:composition-injective`
- **theorem `composition_surjective`** ← `prop:composition-surjective`
- **theorem `composition_bijective`** ← `cor:composition-bijective`
- **theorem `inverse_bijection`** ← `prop:inverse-bijection`
- **theorem `preimage_union_intersection`** ← `prop:preimage-union-intersection`

### `Functions/Scratch/BoundedFunctions.lean`
- **def `FunctionBoundedAbove`** ← `def:function-bounded-above`
- **def `FunctionBoundedBelow`** ← `def:function-bounded-below`
- **def `FunctionBounded`** ← `def:function-bounded`
- **def `FunctionBoundedNear`** ← `def:function-bounded-near-point`
- **def `FunctionBoundedAwayFromZero`** ← `def:function-bounded-away-from-zero`
- **def `FunctionBoundedAwayFromZeroNear`** ← `def:function-bounded-away-from-zero-near`
- **def `UniformlyBoundedFamily`** ← `def:uniformly-bounded-family`
- **theorem `bounded_iff_absolute_value_bounded_above`** ← `thm:bounded-iff-absolute-value-bounded-above`
- **theorem `boundedness_restriction`** ← `prop:boundedness-restriction`
- **theorem `boundedness_not_preserved_under_extension`** ← `prop:boundedness-not-preserved-under-extension`
- **theorem `bounded_away_from_zero_implies_nonzero`** ← `prop:bounded-away-from-zero-implies-nonzero`
- **theorem `bounded_away_from_zero_near_implies_nonzero_near`** ← `prop:bounded-away-from-zero-near-implies-nonzero-near`
- **theorem `bounded_away_from_zero_gives_bounded_reciprocal`** ← `thm:bounded-away-from-zero-gives-bounded-reciprocal`
- **theorem `local_bounded_away_from_zero_gives_local_bounded_reciprocal`** ← `thm:local-bounded-away-from-zero-gives-local-bounded-reciprocal`
- **theorem `uniform_boundedness_transfer_under_pointwise_limit`** ← `thm:uniform-boundedness-transfer-under-pointwise-limit`
- **theorem `bounded_function_algebra_closure`** ← `thm:bounded-function-algebra-closure`
- **theorem `bounded_sum`** ← `cor:bounded-sum`
- **theorem `bounded_difference`** ← `cor:bounded-difference`
- **theorem `bounded_product`** ← `cor:bounded-product`
- **theorem `bounded_scalar_multiple`** ← `cor:bounded-scalar-multiple`
- **theorem `bounded_absolute_value`** ← `cor:bounded-absolute-value`
- **theorem `bounded_max_min`** ← `cor:bounded-max-min`
- **theorem `bounded_functions_form_commutative_ring`** ← `thm:bounded-functions-form-commutative-ring`
- **theorem `bounded_functions_form_real_vector_space`** ← `thm:bounded-functions-form-real-vector-space`
- **theorem `bounded_away_quotient`** ← `thm:bounded-away-quotient`
- **theorem `bounded_quotient_by_bounded_away_denominator`** ← `cor:bounded-quotient-by-bounded-away-denominator`

### `Functions/Scratch/ExtremumPoints.lean`
- **theorem `common_maximum_gives_sum_maximum`** ← `prop:common-maximum-gives-sum-maximum`
- **theorem `common_minimum_gives_sum_minimum`** ← `prop:common-minimum-gives-sum-minimum`
- **theorem `common_extremum_converse_fails`** ← `prop:common-extremum-converse-fails`
- **def `FunctionMaximumPoint`** ← `def:function-maximum-point`
- **theorem `maximum_point_characterized_by_supremum`** ← `thm:maximum-point-characterized-by-supremum`
- **def `FunctionMinimumPoint`** ← `def:function-minimum-point`
- **theorem `minimum_point_characterized_by_infimum`** ← `thm:minimum-point-characterized-by-infimum`
- **theorem `function_extremum_values_are_unique`** ← `prop:function-extremum-values-are-unique`

### `Functions/Scratch/LinearCombinations.lean`
- **def `LinearCombo`** ← `def:linear-combination-of-real-valued-functions`
- **theorem `linear_combination_closure`** ← `prop:linear-combination-closure`, `thm:function-algebra-closure`
- **theorem `bounded_linear_combination`** ← `prop:bounded-linear-combination`
- **def `IsClosedUnderLinearCombinations`** ← `def:real-linear-rule`
- **def `IsRealLinearRule`** ← `def:real-linear-rule`
- **theorem `real_linear_rule_test`** ← `prop:real-linear-rule-test`
- **theorem `real_linear_rule_basic_values`** ← `cor:real-linear-rule-basic-values`

### `Functions/Scratch/MonotoneConstantFunctions.lean`
- **def `FunctionIncreasing`** ← `def:function-increasing`
- **def `FunctionStrictlyIncreasing`** ← `def:function-strictly-increasing`
- **theorem `strictly_increasing_implies_increasing`** ← `prop:strictly-increasing-implies-increasing`
- **def `FunctionDecreasing`** ← `def:function-decreasing`
- **def `FunctionStrictlyDecreasing`** ← `def:function-strictly-decreasing`
- **theorem `strictly_decreasing_implies_decreasing`** ← `prop:strictly-decreasing-implies-decreasing`
- **def `FunctionMonotone`** ← `def:function-monotone`
- **theorem `negation_reverses_monotonicity`** ← `prop:negation-reverses-monotonicity`
- **theorem `positive_scalar_multiples_preserve_monotonicity`** ← `prop:positive-scalar-multiples-preserve-monotonicity`
- **theorem `monotone_need_not_be_strict`** ← `prop:monotone-need-not-be-strict`
- **def `FunctionConstant`** ← `def:function-constant`
- **theorem `constant_function_characterization`** ← `prop:constant-function-characterization`
- **theorem `constant_functions_are_bounded`** ← `prop:constant-functions-are-bounded`
- **theorem `constant_functions_are_monotone`** ← `prop:constant-functions-are-monotone`
- **theorem `monotone_function_algebra`** ← `thm:bounded-function-algebra-closure`
- **theorem `strictly_monotone_implies_injective`** ← *(no book label found)*
- **theorem `monotonicity_restriction`** ← `prop:boundedness-restriction`
- **theorem `composition_of_monotone_functions`** ← *(no book label found)*
- **theorem `inverse_of_strictly_monotone_bijection_is_strictly_monotone`** ← *(no book label found)*

### `Functions/Scratch/PointwiseAlgebra.lean`
- **def `PointwiseSum`** ← `def:pointwise-sum-of-functions`
- **def `PointwiseDiff`** ← `def:pointwise-difference-of-functions`
- **def `PointwiseProd`** ← `def:pointwise-product-of-functions`
- **def `PointwiseScalarMul`** ← `def:pointwise-scalar-multiple-of-a-function`
- **def `PointwiseAbs`** ← `def:pointwise-absolute-value-of-a-function`
- **def `PointwiseMax`** ← `def:pointwise-maximum-of-two-functions`
- **def `PointwiseMin`** ← `def:pointwise-minimum-of-two-functions`
- **def `PointwiseQuotient`** ← `def:pointwise-quotient-of-functions`
- **def `PointwiseReciprocal`** ← `def:pointwise-reciprocal-of-a-function`
- **theorem `function_algebra_closure`** ← `thm:function-algebra-closure`, `prop:pointwise-operation-evaluation`
- **theorem `function_quotient_closure`** ← `thm:function-quotient-closure`
- **theorem `pointwise_max_min_absolute_value_formulas`** ← `prop:pointwise-max-min-absolute-value-formulas`
- **theorem `pointwise_max_min_bounds`** ← `prop:pointwise-max-min-bounds`
- **theorem `quotient_undefined_when_denominator_vanishes`** ← `prop:quotient-undefined-when-denominator-vanishes`

### `Functions/Scratch/PointwiseOperationsRelations.lean`
- **def `AtPointOperation`** ← `def:at-point-operation`
- **def `PointwiseOperationOnSet`** ← `def:pointwise-operation-on-set`
- **def `AtPointRelation`** ← `def:at-point-relation`
- **def `PointwiseRelationOnSet`** ← `def:pointwise-relation-on-set`
- **def `PointwiseRelationNearPoint`** ← `def:pointwise-relation-near-point`
- **theorem `pointwise_operation_evaluation`** ← `prop:pointwise-operation-evaluation`
- **theorem `pointwise_relation_evaluation`** ← `prop:pointwise-relation-evaluation`
- **theorem `pointwise_relation_near_unpacking`** ← `prop:pointwise-relation-near-unpacking`

### `Functions/Scratch/PointwiseOrder.lean`
- **def `PointwiseEq`** ← `def:pointwise-equality-on-set`
- **def `PointwiseLe`** ← *(no book label found)*
- **def `PointwiseLt`** ← *(no book label found)*
- **theorem `pointwise_order_laws`** ← `thm:pointwise-order-laws`
- **theorem `strict_pointwise_order_implies_weak`** ← `prop:strict-pointwise-order-implies-weak`
- **theorem `pointwise_order_arithmetic`** ← `thm:pointwise-order-arithmetic`
- **theorem `pointwise_product_order_nonnegative`** ← `prop:pointwise-product-order-nonnegative`
- **theorem `reciprocal_order_reversal`** ← `prop:reciprocal-order-reversal`
- **theorem `quotient_order_sign_controlled`** ← `prop:quotient-order-sign-controlled`
- **theorem `no_unconditional_quotient_order_law`** ← `prop:no-unconditional-quotient-order-law`

### `Functions/Scratch/SubsetsOfR.lean`
- **def `CenteredOpenInterval`** ← `def:epsilon-neighbourhood`
- **def `PuncturedCenteredOpenInterval`** ← `def:deleted-epsilon-neighbourhood`
- **def `IsClusterPointR`** ← `def:cluster-point-r`
- **theorem `cluster_point_sequential`** ← `thm:cluster-point-sequential`
- **def `IsAdherentPointR`** ← `def:adherent-point-r`
- **def `IsIsolatedPointR`** ← `def:isolated-point-r`
- **def `IsInteriorPointR`** ← `def:interior-point-r`
- **def `IsBoundaryPointR`** ← `def:boundary-point-r`
- **def `InteriorR`** ← `def:interior-r`
- **def `BoundaryR`** ← `def:boundary-r`
- **def `ClosureR`** ← `def:closure-r`
- **theorem `adherent_points_are_closure_points`** ← `prop:adherent-points-are-closure-points`
- **theorem `isolated_points_are_noncluster_adherent_points`** ← `prop:isolated-points-are-noncluster-adherent-points`
- **theorem `interior_membership_characterization`** ← `prop:interior-membership-characterization`
- **theorem `interior_is_contained_in_set`** ← `prop:interior-is-contained-in-set`
- **def `IsClosedR`** ← `def:closed-set-r`
- **theorem `closure_is_smallest_closed_superset`** ← `prop:closure-is-smallest-closed-superset`
- **theorem `boundary_as_closure_minus_interior`** ← `prop:boundary-as-closure-minus-interior`
- **theorem `closure_elementary`** ← `lem:closure-elementary`
- **theorem `closed_iff_seq_limits`** ← `cor:closed-iff-seq-limits`
- **theorem `interval_all_limit_points`** ← `cor:interval-all-limit-points`
- **def `IsBoundedSetR`** ← `def:bounded-set-r`
- **theorem `heine_borel_subsets_real_line`** ← `thm:heine-borel-subsets-real-line`
- **def `TrueNear`** ← `def:true-near`
- **theorem `true_near_stable_under_shrinking`** ← `prop:true-near-stable-under-shrinking`
- **theorem `true_near_stable_under_conjunction`** ← `prop:true-near-stable-under-conjunction`
- **def `IsOpenR`** ← `def:closed-set-r`
- **theorem `open_iff_complement_closed`** ← *(no book label found)*
- **theorem `finite_set_is_closed`** ← `def:closed-set-r`

### `Functions/Scratch/SupInfOfFunctions.lean`
- **def `FunctionSupremumOnSet`** ← `def:function-supremum-on-set`
- **def `FunctionInfimumOnSet`** ← `def:function-infimum-on-set`
- **def `PointwiseSupremumFamily`** ← `def:pointwise-supremum-family`
- **def `PointwiseInfimumFamily`** ← `def:pointwise-infimum-family`
- **theorem `function_supremum_existence`** ← `thm:function-supremum-existence`
- **theorem `function_infimum_existence`** ← `thm:function-infimum-existence`
- **theorem `supremum_monotone_under_pointwise_order`** ← `thm:supremum-monotone-under-pointwise-order`
- **theorem `infimum_monotone_under_pointwise_order`** ← `thm:infimum-monotone-under-pointwise-order`
- **theorem `supremum_monotonicity_converse_fails`** ← `prop:supremum-monotonicity-converse-fails`
- **theorem `pointwise_supremum_evaluation`** ← `thm:pointwise-supremum-evaluation`
- **theorem `pointwise_infimum_evaluation`** ← `thm:pointwise-infimum-evaluation`
- **theorem `supremum_subadditivity`** ← `thm:supremum-subadditivity`
- **theorem `infimum_superadditivity`** ← `thm:infimum-superadditivity`
- **theorem `supremum_negation`** ← `thm:supremum-negation`
- **theorem `infimum_negation`** ← `thm:infimum-negation`
- **theorem `supremum_scalar_multiple`** ← `thm:supremum-scalar-multiple`
- **theorem `infimum_scalar_multiple`** ← `thm:infimum-scalar-multiple`
- **theorem `finite_family_pointwise_supremum_is_maximum`** ← `cor:finite-family-pointwise-supremum-is-maximum`
- **theorem `finite_family_pointwise_infimum_is_minimum`** ← `cor:finite-family-pointwise-infimum-is-minimum`

## Integration

### `Integration/Scratch/CauchyIntegral.lean`
- **def `CauchySum`** ← `def:cauchy-sum`
- **def `HasCauchyIntegral`** ← `def:cauchy-integral`
- **def `IsCauchyIntegrable`** ← *(no book label found)*
- **theorem `cauchy_integral_constant`** ← `prop:cauchy-integral-constant`
- **theorem `cauchy_integral_linearity`** ← `thm:cauchy-integral-linearity`
- **theorem `cauchy_integral_monotonicity`** ← `thm:cauchy-integral-monotonicity`
- **theorem `cauchy_integral_bounds`** ← `cor:cauchy-integral-bounds`
- **theorem `cauchy_integral_triangle_inequality`** ← `thm:cauchy-integral-triangle-inequality`
- **theorem `cauchy_integral_interval_additivity`** ← `thm:cauchy-integral-interval-additivity`
- **def `IntervalOscillation`** ← `def:interval-oscillation-integration`
- **theorem `continuous_cauchy_integrable`** ← `thm:continuous-cauchy-integrable`
- **theorem `cauchy_tag_independence`** ← `thm:cauchy-tag-independence`, `def:riemann-integral`
- **theorem `cauchy_step_function_failure_witness`** ← *(no book label found)*

### `Integration/Scratch/DarbouxIntegral.lean`
- **def `LowerDarbouxSum`** ← `def:darboux-sums`
- **def `UpperDarbouxSum`** ← *(no book label found)*
- **theorem `darboux_refinement_squeeze`** ← `lem:darboux-refinement-squeeze`
- **def `IsDarbouxIntegrable`** ← `def:darboux-integrability`
- **theorem `darboux_criterion`** ← `thm:darboux-criterion`
- **theorem `riemann_darboux_equivalence`** ← `thm:riemann-darboux-equivalence`
- **theorem `continuous_darboux_integrable`** ← `thm:continuous-darboux-integrable`
- **theorem `monotone_darboux_integrable`** ← `thm:monotone-darboux-integrable`
- **theorem `finite_discontinuities_darboux_integrable`** ← `thm:finite-discontinuities-darboux-integrable`
- **theorem `darboux_integrable_linear_combinations`** ← `thm:darboux-integrable-linear-combinations`
- **theorem `darboux_integrable_products`** ← `thm:darboux-integrable-products`
- **theorem `darboux_integrable_absolute_value`** ← `thm:darboux-integrable-absolute-value`
- **theorem `darboux_integrable_continuous_composition`** ← `thm:darboux-integrable-continuous-composition`
- **theorem `dirichlet_not_darboux_integrable`** ← *(no book label found)*

### `Integration/Scratch/HenstockKurzweil.lean`
- **def `IsGaugeOn`** ← `def:gauge-on-interval`
- **def `IsHKDeltaFine`** ← `def:delta-fine-tagged-partition`
- **def `HasHKIntegral`** ← `def:henstock-kurzweil-integral`
- **def `IsHKIntegrable`** ← *(no book label found)*
- **theorem `cousins_lemma`** ← `lem:cousin`
- **theorem `riemann_integrable_implies_hk_integrable`** ← `thm:riemann-integrable-implies-hk-integrable`
- **theorem `hk_straddle`** ← `lem:hk-straddle`
- **theorem `hk_fundamental_theorem`** ← `thm:hk-fundamental-theorem`
- **theorem `continuous_hk_integrable`** ← `thm:continuous-hk-integrable`
- **theorem `hk_strictly_wider_than_lebesgue_witness`** ← *(no book label found)*

### `Integration/Scratch/McShaneIntegral.lean`
- **structure `McShaneTaggedPartition`** ← `def:mcshane-fine-tagged-partition`
- **def `IsMcShaneDeltaFine`** ← `def:mcshane-fine-tagged-partition`
- **def `HasMcShaneIntegral`** ← `def:mcshane-integral`
- **def `IsMcShaneIntegrable`** ← *(no book label found)*
- **theorem `riemann_mcshane_hk_inclusions`** ← `thm:riemann-mcshane-hk-inclusions`
- **theorem `mcshane_equals_lebesgue`** ← `thm:mcshane-equals-lebesgue`
- **theorem `hk_strictly_wider_than_mcshane`** ← *(no book label found)*

### `Integration/Scratch/MeasureZero.lean`
- **def `IsMeasureZero`** ← `def:measure-zero`
- **def `PointOscillation`** ← `def:point-oscillation-integration`
- **theorem `lebesgue_criterion_riemann_integrability`** ← `thm:lebesgue-criterion-riemann-integrability`

### `Integration/Scratch/Partitions.lean`
- **structure `IntegrationPartition`** ← `def:integration-partition`
- **def `SubintervalWidth`** ← `def:subinterval-width-integration`
- **def `PartitionMesh`** ← `def:partition-mesh`
- **structure `TaggedPartitionIntegration`** ← `def:tagged-partition-integration`
- **def `RefinesPartition`** ← `def:partition-refinement`
- **theorem `common_refinement_partitions`** ← `lem:common-refinement-partitions`

### `Integration/Scratch/RiemannIntegral.lean`
- **def `RiemannSum`** ← `def:riemann-sum`
- **def `HasRiemannIntegral`** ← `def:riemann-integral`
- **def `IsRiemannIntegrable`** ← *(no book label found)*
- **theorem `continuous_riemann_integrable`** ← `thm:continuous-riemann-integrable`
- **theorem `thomae_riemann_integrable_zero`** ← *(no book label found)*
- **theorem `riemann_integral_linearity`** ← `thm:riemann-integral-linearity`
- **theorem `riemann_integral_monotonicity`** ← `thm:riemann-integral-monotonicity`
- **theorem `riemann_integral_triangle_inequality`** ← `thm:riemann-integral-triangle-inequality`
- **theorem `riemann_integral_interval_additivity`** ← `thm:riemann-integral-interval-additivity`
- **theorem `riemann_integral_interval_additivity_value`** ← *(no book label found)*
- **theorem `riemann_cauchy_criterion`** ← `thm:riemann-cauchy-criterion`

### `Integration/Scratch/RiemannStieltjes.lean`
- **def `VariationSums`** ← `def:total-variation`
- **def `HasBoundedVariation`** ← `def:bounded-variation-integration`
- **def `TotalVariation`** ← `def:total-variation`
- **theorem `monotone_bounded_variation`** ← `prop:monotone-bounded-variation`
- **def `HasRiemannStieltjesIntegral`** ← `def:riemann-stieltjes-integral`
- **def `IsRiemannStieltjesIntegrable`** ← *(no book label found)*
- **theorem `rs_continuous_bv_existence`** ← `thm:rs-continuous-bv-existence`
- **theorem `rs_bilinearity`** ← `thm:rs-bilinearity`
- **theorem `rs_interval_additivity`** ← `thm:rs-interval-additivity`
- **theorem `rs_integration_by_parts`** ← `thm:rs-integration-by-parts`
- **theorem `rs_c1_reduction`** ← `thm:rs-c1-reduction`
- **theorem `rs_step_integrator_finite_sum`** ← `thm:rs-step-integrator-finite-sum`
- **theorem `rs_shared_jump_failure_witness`** ← *(no book label found)*

## RealAnalysis

### `RealAnalysis/Scratch/AsymptoticAndInequalityAdditions.lean`
- **def `IsBigOAt`** ← `def:little-o-at-a-point`
- **def `IsBigOAtTop`** ← `def:little-o-at-infinity`
- **theorem `little_o_implies_big_o_at`** ← `def:little-o-at-a-point`
- **theorem `little_o_implies_big_o_at_top`** ← *(no book label found)*
- **theorem `youngs_inequality`** ← `thm:ineq-holder`
- **def `IsConvexOnR`** ← *(no book label found)*
- **theorem `jensens_inequality_finite`** ← *(no book label found)*

### `RealAnalysis/Scratch/AsymptoticNotation.lean`
- **def `IsLittleOAt`** ← `def:little-o-at-a-point`
- **def `IsLittleOAtTop`** ← `def:little-o-at-infinity`
- **def `IsIncrementLittleO`** ← `def:increment-little-o`
- **theorem `little_o_quotient_characterization`** ← `prop:little-o-quotient-characterization`
- **theorem `little_o_sum_rule`** ← `prop:little-o-sum-rule`
- **theorem `little_o_bounded_factor_rule`** ← `prop:little-o-bounded-factor-rule`

### `RealAnalysis/Scratch/BisectionNestedIntervalsToolkit.lean`
- **theorem `nested_interval_property`** ← `thm:nested-interval-property`
- **theorem `ivt_bisection`** ← `prop:ivt-bisection`
- **theorem `r_uncountable`** ← `prop:r-uncountable`

### `RealAnalysis/Scratch/CompletenessConstructionToolkit.lean`
- **theorem `eps_char_sup`** ← `prop:eps-char-sup`
- **theorem `inductive_selection`** ← `thm:inductive-selection`
- **theorem `monotone_approx_bounds`** ← `prop:monotone-approx-bounds`

### `RealAnalysis/Scratch/ErrorPropagation.lean`
- **def `AbsoluteError`** ← `def:absolute-error-approximation`
- **def `RelativeError`** ← `def:relative-error-approximation`
- **theorem `absolute_error_sum`** ← `thm:absolute-error-sum`
- **theorem `absolute_error_product`** ← `thm:absolute-error-product`
- **theorem `absolute_error_quotient`** ← `thm:absolute-error-quotient`
- **theorem `relative_error_product`** ← `prop:relative-error-product`
- **theorem `relative_error_quotient`** ← `prop:relative-error-quotient`

### `RealAnalysis/Scratch/InequalitiesBoundingToolkit.lean`
- **theorem `order_arithmetic`** ← `prop:order-arithmetic`

### `RealAnalysis/Scratch/InequalityNamedInequalities.lean`
- **theorem `ineq_am_gm_two`** ← `thm:ineq-am-gm-two`
- **def `ArithmeticMean`** ← `def:classical-means`
- **def `GeometricMean`** ← `def:classical-means`
- **def `HarmonicMean`** ← `def:classical-means`
- **theorem `ineq_am_gm`** ← `thm:ineq-am-gm`
- **theorem `ineq_am_gm_hm`** ← `thm:ineq-am-gm-hm`
- **theorem `ineq_cauchy_schwarz`** ← `thm:ineq-cauchy-schwarz`
- **theorem `ineq_chebyshev_sum`** ← `thm:ineq-chebyshev-sum`
- **theorem `ineq_rearrangement`** ← `thm:ineq-rearrangement`
- **theorem `ineq_holder`** ← `thm:ineq-holder`
- **theorem `ineq_minkowski`** ← `thm:ineq-minkowski`
- **theorem `ineq_bernoulli`** ← `thm:ineq-bernoulli`

### `RealAnalysis/Scratch/InequalityOrderArithmetic.lean`
- **theorem `real_order_trichotomy`** ← `thm:real-order-trichotomy`
- **theorem `ineq_add_both_sides`** ← `thm:ineq-add-both-sides`
- **theorem `ineq_nonstrict_add_both_sides`** ← `thm:ineq-nonstrict-add-both-sides`
- **theorem `ineq_add_inequalities`** ← `thm:ineq-add-inequalities`
- **theorem `ineq_nonstrict_add_inequalities`** ← `thm:ineq-nonstrict-add-inequalities`
- **theorem `positive_sum`** ← `lem:positive-sum`
- **theorem `subtraction_of_inequalities_not_valid`** ← `prop:subtraction-of-inequalities-not-valid`
- **theorem `ineq_mixed_add`** ← `thm:ineq-mixed-add`
- **theorem `ineq_multiply_positive`** ← `thm:ineq-multiply-positive`
- **theorem `ineq_multiply_negative`** ← `thm:ineq-multiply-negative`
- **theorem `ineq_nonstrict_multiply_positive`** ← `thm:ineq-nonstrict-multiply-positive`
- **theorem `ineq_nonstrict_multiply_nonneg`** ← `thm:ineq-nonstrict-multiply-nonneg`
- **theorem `positive_product`** ← `lem:positive-product`
- **theorem `negative_times_negative_is_positive`** ← `lem:negative-times-negative-is-positive`
- **theorem `positive_times_negative_is_negative`** ← `lem:positive-times-negative-is-negative`
- **theorem `negative_times_positive_is_negative`** ← `lem:negative-times-positive-is-negative`
- **theorem `order_and_subtraction`** ← `lem:order-and-subtraction`
- **theorem `non_strict_order_and_subtraction`** ← `lem:non-strict-order-and-subtraction`
- **theorem `division_by_positive_preserves_order`** ← `lem:division-by-positive-preserves-order`
- **theorem `division_by_negative_reverses_order`** ← `lem:division-by-negative-reverses-order`
- **theorem `positive_multiplication_cancellation`** ← `lem:positive-multiplication-cancellation`
- **theorem `division_of_inequalities_not_valid`** ← `prop:division-of-inequalities-not-valid`
- **theorem `ineq_squeeze`** ← `thm:ineq-squeeze`
- **theorem `ineq_transitivity_strict`** ← `thm:ineq-transitivity-strict`
- **theorem `ineq_transitivity_mixed`** ← `thm:ineq-transitivity-mixed`
- **theorem `ineq_reciprocal_positive`** ← `thm:ineq-reciprocal-positive`
- **theorem `ineq_reciprocal_flip`** ← `thm:ineq-reciprocal-flip`

### `RealAnalysis/Scratch/InequalitySquaresAndRoots.lean`
- **theorem `square_nonnegative`** ← `thm:square-nonnegative`
- **theorem `real_square_root_function`** ← `def:real-square-root-function`
- **theorem `sqrt_nonnegative`** ← `thm:sqrt-nonnegative`
- **theorem `sqrt_square`** ← `thm:sqrt-square`
- **theorem `sqrt_zero_one`** ← `thm:sqrt-zero-one`
- **theorem `sqrt_positive`** ← `thm:sqrt-positive`
- **theorem `sqrt_of_square_absolute_value`** ← `thm:sqrt-of-square-absolute-value`
- **theorem `sqrt_product`** ← `thm:sqrt-product`
- **theorem `sqrt_quotient`** ← `thm:sqrt-quotient`
- **theorem `ineq_square_root_strict_monotone`** ← `thm:ineq-square-root-strict-monotone`
- **theorem `positive_powers_are_positive`** ← `lem:positive-powers-are-positive`
- **theorem `powers_preserve_order_for_positive_numbers`** ← `lem:powers-preserve-order-for-positive-numbers`
- **theorem `ineq_square_monotone`** ← `thm:ineq-square-monotone`
- **theorem `ineq_square_root_monotone`** ← `thm:ineq-square-root-monotone`
- **theorem `positive_square_comparison`** ← `thm:positive-square-comparison`
- **theorem `unit_interval_square_bounds`** ← `thm:unit-interval-square-bounds`

### `RealAnalysis/Scratch/Modulus.lean`
- **def `AbsR`** ← `def:absolute-value`
- **theorem `absolute_value_nonneg`** ← `thm:absolute-value-nonneg`
- **theorem `absolute_value_zero_iff_zero`** ← `thm:absolute-value-zero-iff-zero`
- **theorem `absolute_value_self_or_neg`** ← `thm:absolute-value-self-or-neg`
- **theorem `absolute_value_symmetric`** ← `thm:absolute-value-symmetric`
- **theorem `absolute_value_product`** ← `thm:absolute-value-product`
- **theorem `absolute_value_quotient`** ← `thm:absolute-value-quotient`
- **theorem `absolute_value_bounds`** ← `thm:absolute-value-bounds`
- **theorem `absolute_value_le_iff`** ← `thm:absolute-value-le-iff`
- **theorem `absolute_value_lt_iff`** ← `thm:absolute-value-lt-iff`
- **theorem `reverse_triangle_inequality`** ← `thm:reverse-triangle-inequality`
- **theorem `absolute_value_sum_bound`** ← `thm:absolute-value-sum-bound`

### `RealAnalysis/Scratch/PredicateWalkingToolkit.lean`
- **theorem `io_ev_dichotomy`** ← `prop:io-ev-dichotomy`
- **theorem `monotone_subsequence`** ← `thm:monotone-subsequence`
- **theorem `bw_bisection`** ← `prop:bw-bisection`

### `RealAnalysis/Scratch/ResiduePartitionToolkit.lean`
- **theorem `k_periodicity`** ← `thm:k-periodicity`
- **theorem `residue_divergence`** ← `prop:residue-divergence`
- **theorem `alternating_series_test`** ← `thm:alternating-series-test`

## Sequences

### `Sequences/Scratch/AlgebraOfLimits.lean`
- **def `PointwiseSum`** ← `def:pointwise-sum-sequence`
- **def `PointwiseDifference`** ← `def:pointwise-difference-sequence`
- **def `ScalarMultiple`** ← `def:scalar-multiple-sequence`
- **def `LinearCombination`** ← `def:linear-combination-of-real-sequences`
- **def `PointwiseNegation`** ← `def:pointwise-negation-sequence`
- **def `PointwiseProduct`** ← `def:pointwise-product-sequence`
- **def `ReciprocalSeq`** ← `def:reciprocal-sequence`
- **def `PointwiseQuotient`** ← `def:pointwise-quotient-sequence`
- **def `SquareSeq`** ← `def:square-sequence`
- **def `AbsSeq`** ← `def:absolute-value-sequence`
- **def `SqrtSeq`** ← `def:square-root-sequence`
- **theorem `limit_of_scalar_multiple`** ← `thm:limit-of-scalar-multiple`
- **theorem `limit_of_a_sum`** ← `thm:limit-of-a-sum`
- **theorem `limit_of_a_negation`** ← `thm:limit-of-a-negation`
- **theorem `limit_of_a_difference`** ← `thm:limit-of-a-difference`
- **theorem `limit_of_a_product`** ← `thm:limit-of-a-product`
- **theorem `nonzero_limit_eventually_nonzero`** ← `thm:nonzero-limit-eventually-nonzero`
- **theorem `limit_of_a_reciprocal`** ← `thm:limit-of-a-reciprocal`
- **theorem `limit_of_a_quotient`** ← `thm:limit-of-a-quotient`
- **theorem `limit_of_a_square`** ← `thm:limit-of-a-square`
- **theorem `limit_of_an_absolute_value`** ← `thm:limit-of-an-absolute-value`
- **theorem `positive_limit_eventually_positive`** ← `thm:positive-limit-eventually-positive`
- **theorem `limit_of_a_square_root`** ← `thm:limit-of-a-square-root`
- **theorem `polynomial_sequence_limit`** ← `thm:polynomial-sequence-limit`
- **theorem `rational_sequence_limit`** ← `thm:rational-sequence-limit`

### `Sequences/Scratch/Applications.lean`
- **def `NewtonSeqSqrtTwo`** ← `def:newton-sequence-sqrt-two`
- **theorem `newton_approximation_sqrt_two`** ← `thm:newton-approximation-sqrt-two`
- **def `FactorialPartialSums`** ← `def:factorial-partial-sums`
- **theorem `factorial_partial_sums_approximate_e`** ← `thm:factorial-partial-sums-approximate-e`, `def:number-e`
- **def `CompoundInterestSeq`** ← `def:compound-interest-sequence`
- **theorem `compound_interest_approximation_e`** ← `thm:compound-interest-approximation-e`
- **def `DecimalTruncationSeq`** ← `def:decimal-truncation-sequence`
- **theorem `decimal_truncations_converge`** ← `thm:decimal-truncations-converge`

### `Sequences/Scratch/Cauchy.lean`
- **def `IsCauchy`** ← `def:cauchy-sequence`
- **theorem `convergent_sequences_are_cauchy`** ← `thm:convergent-sequences-are-cauchy`
- **theorem `cauchy_sequences_are_bounded`** ← `thm:cauchy-sequences-are-bounded`
- **theorem `cauchy_convergent_subsequence_converges`** ← `thm:cauchy-convergent-subsequence-converges`
- **theorem `cauchy_criterion_real_sequences`** ← `thm:cauchy-criterion-real-sequences`
- **theorem `cauchy_criterion_via_tails`** ← `thm:cauchy-criterion-via-tails`
- **theorem `cauchy_tail_diameter_criterion`** ← `thm:cauchy-tail-diameter-criterion`
- **theorem `cauchy_successive_differences_vanish`** ← `thm:cauchy-successive-differences-vanish`
- **theorem `scalar_multiple_cauchy_sequence`** ← `thm:scalar-multiple-cauchy-sequence`
- **theorem `sum_cauchy_sequences`** ← `thm:sum-cauchy-sequences`
- **theorem `difference_cauchy_sequences`** ← `thm:difference-cauchy-sequences`
- **theorem `linear_combination_cauchy_sequences`** ← `thm:linear-combination-cauchy-sequences`
- **theorem `product_cauchy_sequences`** ← `thm:product-cauchy-sequences`
- **theorem `reciprocal_cauchy_sequence`** ← `thm:reciprocal-cauchy-sequence`
- **theorem `quotient_cauchy_sequences`** ← `thm:quotient-cauchy-sequences`
- **theorem `absolute_value_cauchy_sequence`** ← `thm:absolute-value-cauchy-sequence`

### `Sequences/Scratch/ClusterValues.lean`
- **def `IsClusterValueOf`** ← `def:cluster-value-sequence`
- **theorem `cluster_values_are_subsequential_limits`** ← `thm:cluster-values-are-subsequential-limits`
- **theorem `bounded_sequences_have_cluster_values`** ← `thm:bounded-sequences-have-cluster-values`
- **theorem `limsup_liminf_extremal_cluster_values`** ← `thm:limsup-liminf-extremal-cluster-values`

### `Sequences/Scratch/Convergence.lean`
- **def `ConvergesTo`** ← `def:convergent-sequence`
- **def `CenteredInterval`** ← *(no book label found)*
- **def `ConvergesToNbhd`** ← `def:convergent-sequence-neighborhood`
- **theorem `equivalence_of_convergence_formulations`** ← `thm:equivalence-of-convergence-formulations`

### `Sequences/Scratch/Divergence.lean`
- **theorem `is`** ← *(no book label found)*
- **def `IsDivergent`** ← `def:divergent-sequence`
- **def `DivergesToPosInf`** ← `def:diverges-to-positive-infinity`
- **def `DivergesToNegInf`** ← `def:diverges-to-negative-infinity`
- **def `IsOscillatory`** ← `def:oscillatory-sequence`
- **theorem `divergence_to_infinity_implies_real_divergence`** ← `thm:divergence-to-infinity-implies-real-divergence`
- **theorem `two_subsequential_limits_force_divergence`** ← `thm:two-subsequential-limits-force-divergence`
- **theorem `unbounded_above_has_positive_infinity_subsequence`** ← `thm:unbounded-above-has-positive-infinity-subsequence`
- **theorem `unbounded_below_has_negative_infinity_subsequence`** ← `thm:unbounded-below-has-negative-infinity-subsequence`
- **theorem `bounded_divergence_produces_two_subsequential_limits`** ← `thm:bounded-divergence-produces-two-subsequential-limits`

### `Sequences/Scratch/ExamplesCounterexamples.lean`
- **theorem `example_constant_sequence`** ← `ex:sequence-example-constant`
- **theorem `example_reciprocal_sequence`** ← `ex:sequence-example-reciprocal`
- **theorem `example_alternating_null_sequence`** ← `ex:sequence-example-alternating-null`
- **theorem `example_oscillating_sequence`** ← `ex:sequence-example-oscillating`
- **theorem `example_geometric_sequence`** ← `ex:sequence-example-geometric`
- **theorem `example_bounded_not_convergent`** ← `ex:sequence-counterexample-bounded-not-convergent`
- **theorem `hasn't`** ← *(no book label found)*
- **theorem `example_vanishing_differences_not_cauchy`** ← `ex:sequence-counterexample-successive-differences-not-cauchy`

### `Sequences/Scratch/LiminfLimsup.lean`
- **def `TailSupSeq`** ← `def:tail-supremum-sequence`
- **def `TailInfSeq`** ← `def:tail-infimum-sequence`
- **def `LimsupSeq`** ← `def:limsup-sequence`
- **def `LiminfSeq`** ← `def:liminf-sequence`
- **theorem `tail_suprema_are_decreasing`** ← `thm:tail-suprema-are-decreasing`
- **theorem `tail_infima_are_increasing`** ← `thm:tail-infima-are-increasing`
- **theorem `liminf_below_limsup`** ← `thm:liminf-below-limsup`
- **theorem `convergence_iff_liminf_equals_limsup`** ← `thm:convergence-iff-liminf-equals-limsup`
- **theorem `limsup_largest_subsequential_limit`** ← `thm:limsup-largest-subsequential-limit`
- **theorem `liminf_smallest_subsequential_limit`** ← `thm:liminf-smallest-subsequential-limit`
- **theorem `oscillation_criterion_via_liminf_limsup`** ← `thm:oscillation-criterion-via-liminf-limsup`
- **theorem `limsup_comparison_under_eventual_order`** ← `thm:limsup-comparison-under-eventual-order`
- **theorem `liminf_comparison_under_eventual_order`** ← `thm:liminf-comparison-under-eventual-order`
- **theorem `limsup_squeeze_under_eventual_order`** ← `thm:limsup-squeeze-under-eventual-order`
- **theorem `liminf_squeeze_under_eventual_order`** ← `thm:liminf-squeeze-under-eventual-order`
- **theorem `limsup_neg_eq_neg_liminf`** ← *(no book label found)*
- **theorem `liminf_neg_eq_neg_limsup`** ← *(no book label found)*

### `Sequences/Scratch/Limits.lean`
- **theorem `uniqueness_of_limits`** ← `thm:uniqueness-of-limits`
- **theorem `limit_preserves_eventual_order`** ← `thm:limit-preserves-eventual-order`
- **theorem `strict_limit_separation_gives_eventual_order`** ← `thm:strict-limit-separation-gives-eventual-order`
- **theorem `eventual_strict_comparison_preserves_weak_limit_order_lt`** ← `thm:eventual-strict-comparison-preserves-weak-limit-order`
- **theorem `eventual_strict_comparison_preserves_weak_limit_order_gt`** ← `thm:eventual-strict-comparison-preserves-weak-limit-order`
- **theorem `constant_comparison_sequence_limits_le`** ← `thm:constant-comparison-sequence-limits`
- **theorem `constant_comparison_sequence_limits_lt`** ← `thm:constant-comparison-sequence-limits`
- **theorem `constant_comparison_sequence_limits_ge`** ← `thm:constant-comparison-sequence-limits`
- **theorem `constant_comparison_sequence_limits_gt`** ← `thm:constant-comparison-sequence-limits`
- **theorem `constant_squeeze_theorem`** ← `thm:constant-squeeze-theorem`
- **theorem `sequence_squeeze_theorem`** ← `thm:sequence-squeeze-theorem`
- **theorem `absolute_value_squeeze_theorem`** ← `thm:absolute-value-squeeze-theorem`
- **theorem `anywhere`** ← *(no book label found)*
- **theorem `convergent_sequence_is_bounded`** ← `ex:sequence-natural`, `thm:limit-of-a-product`

### `Sequences/Scratch/Monotonicity.lean`
- **def `IsIncreasing`** ← `def:increasing-sequence`
- **def `IsDecreasing`** ← `def:decreasing-sequence`
- **def `IsStrictlyIncreasing`** ← `def:strictly-increasing-sequence`
- **def `IsStrictlyDecreasing`** ← `def:strictly-decreasing-sequence`
- **def `IsMonotoneSeq`** ← `def:monotone-sequence`
- **def `IsEventuallyIncreasing`** ← `def:eventually-increasing-sequence`
- **def `IsEventuallyDecreasing`** ← `def:eventually-decreasing-sequence`
- **def `IsEventuallyMonotone`** ← `def:eventually-monotone-sequence`
- **theorem `monotone_convergence_theorem_increasing`** ← `thm:monotone-convergence-theorem`
- **theorem `monotone_convergence_theorem_decreasing`** ← `thm:monotone-convergence-theorem`
- **theorem `strict_increasing_implies_increasing`** ← `thm:strict-monotonicity-implies-monotonicity`
- **theorem `strict_decreasing_implies_decreasing`** ← `thm:strict-monotonicity-implies-monotonicity`
- **theorem `bounded_monotone_sequence_equivalences_incr`** ← `thm:bounded-monotone-sequence-equivalences`
- **theorem `bounded_monotone_sequence_equivalences_decr`** ← `thm:bounded-monotone-sequence-equivalences`
- **theorem `increasing_bounded_below_by_first_term`** ← *(no book label found)*
- **theorem `decreasing_bounded_above_by_first_term`** ← *(no book label found)*
- **theorem `bounded_monotone_sequence_equivalences`** ← `thm:bounded-monotone-sequence-equivalences`
- **theorem `eventually_monotone_convergence_theorem_incr`** ← `thm:eventually-monotone-convergence-theorem`
- **theorem `eventually_monotone_convergence_theorem_decr`** ← `thm:eventually-monotone-convergence-theorem`
- **theorem `eventually_monotone_convergence_theorem`** ← `thm:eventually-monotone-convergence-theorem`
- **theorem `unbounded_monotone_divergence_pos`** ← `thm:unbounded-monotone-divergence`, `def:diverges-to-positive-infinity`
- **theorem `unbounded_monotone_divergence_neg`** ← `thm:unbounded-monotone-divergence`
- **theorem `translation_preserves_increasing`** ← `thm:algebraic-transformations-preserve-monotonicity`
- **theorem `translation_preserves_decreasing`** ← `thm:algebraic-transformations-preserve-monotonicity`
- **theorem `positive_scalar_preserves_increasing`** ← `thm:algebraic-transformations-preserve-monotonicity`
- **theorem `negative_scalar_reverses_increasing`** ← `thm:algebraic-transformations-preserve-monotonicity`
- **theorem `negation_reverses_increasing`** ← `thm:algebraic-transformations-preserve-monotonicity`
- **theorem `negation_reverses_decreasing`** ← `thm:algebraic-transformations-preserve-monotonicity`

### `Sequences/Scratch/NullConstantSequences.lean`
- **def `IsConstant`** ← `def:constant-sequence`
- **def `IsNull`** ← `def:null-sequence`
- **def `IsUltimatelyConstant`** ← `def:ultimately-constant-sequence`
- **def `BoundedAboveSeq`** ← `def:sequence-bounded-above`
- **def `BoundedBelowSeq`** ← `def:sequence-bounded-below`
- **def `BoundedSeq`** ← `def:bounded-sequence`
- **theorem `constant_sequence_convergence`** ← `thm:constant-sequence-convergence`
- **theorem `zero_sequence_is_null`** ← `thm:zero-sequence-is-null`
- **theorem `constant_null_sequence`** ← `thm:constant-null-sequence`
- **theorem `difference_from_limit_is_null`** ← `thm:difference-from-limit-is-null`
- **theorem `ultimately_constant_sequence_convergence`** ← `thm:ultimately-constant-sequence-convergence`
- **theorem `constant_implies_ultimately_constant`** ← `thm:constant-implies-ultimately-constant`
- **theorem `ultimately_zero_sequence_is_null`** ← `thm:ultimately-zero-sequence-is-null`
- **theorem `ultimately_constant_null_sequence`** ← `thm:ultimately-constant-null-sequence`
- **theorem `tail_equality_preserves_convergence`** ← `thm:tail-equality-preserves-convergence`
- **theorem `eventually_bounded_above_tail_formulation`** ← `thm:eventually-bounded-above-tail-formulation`
- **theorem `eventually_bounded_below_tail_formulation`** ← `thm:eventually-bounded-below-tail-formulation`
- **theorem `eventually_bounded_tail_formulation`** ← `thm:eventually-bounded-tail-formulation`
- **theorem `bounded_sequence_bounded_above_below`** ← `thm:bounded-sequence-bounded-above-below`
- **theorem `absolute_bound_upper_lower_bounds`** ← `thm:absolute-bound-upper-lower-bounds`
- **theorem `upper_lower_bounds_absolute_bound`** ← `thm:upper-lower-bounds-absolute-bound`

### `Sequences/Scratch/OrderLimits.lean`
- **theorem `increasing_sequence_limit_as_supremum`** ← `thm:increasing-sequence-limit-as-supremum`
- **theorem `decreasing_sequence_limit_as_infimum`** ← `thm:decreasing-sequence-limit-as-infimum`
- **theorem `tail_suprema_infima_converge`** ← `thm:tail-suprema-infima-converge`
- **theorem `bounded_sequence_limsup_liminf`** ← `thm:bounded-sequence-limsup-liminf`

### `Sequences/Scratch/SequenceDefinitions.lean`
- **theorem `not`** ← *(no book label found)*
- **abbrev `Sequence`** ← `def:sequence`
- **abbrev `RealSequence`** ← `def:real-sequence`
- **theorem `constant_sequence_converges`** ← `ex:constant-sequence`
- **theorem `reciprocal_sequence_converges_to_zero`** ← `ex:sequence-reciprocal`
- **theorem `natural_number_sequence_diverges`** ← `ex:sequence-natural`

### `Sequences/Scratch/Subsequences.lean`
- **def `IsStrictlyIncreasingIndexMap`** ← `def:strictly-increasing-index-map`
- **def `IsSubsequenceOf`** ← `def:subsequence-of-sequence`
- **def `IsSubsequentialLimit`** ← `def:subsequential-limit`
- **def `HasConvergentSubsequence`** ← `def:has-convergent-subsequence`
- **theorem `subsequence_indices_dominate_identity`** ← `thm:subsequence-indices-dominate-identity`
- **theorem `subsequences_preserve_limits`** ← `thm:subsequences-preserve-limits`
- **theorem `subsequential_limit_of_convergent_sequence`** ← `thm:subsequential-limit-of-convergent-sequence`
- **theorem `divergence_by_two_subsequential_limits`** ← `thm:divergence-by-two-subsequential-limits`
- **theorem `boundedness_passes_to_subsequences`** ← `thm:boundedness-passes-to-subsequences`
- **theorem `monotonicity_passes_to_subsequences_incr`** ← `thm:monotonicity-passes-to-subsequences`
- **theorem `monotonicity_passes_to_subsequences_decr`** ← `thm:monotonicity-passes-to-subsequences`
- **theorem `subsequence_of_subsequence`** ← `thm:subsequence-of-subsequence`
- **theorem `eventual_properties_pass_to_subsequences`** ← `thm:eventual-properties-pass-to-subsequences`
- **theorem `frequent_properties_yield_subsequences`** ← `thm:frequent-properties-yield-subsequences`
- **theorem `subsequential_limits_respect_bounds`** ← `thm:subsequential-limits-respect-bounds`
- **theorem `squeeze_passes_to_subsequences`** ← `thm:squeeze-passes-to-subsequences`
- **theorem `monotone_subsequence_theorem`** ← `thm:monotone-subsequence-theorem`
- **theorem `bolzano_weierstrass_sequences`** ← `thm:bolzano-weierstrass-sequences`
- **theorem `sequential_compactness_closed_bounded_interval`** ← `thm:sequential-compactness-closed-bounded-interval`
- **theorem `subsequence_principle`** ← *(no book label found)*
- **theorem `bounded_sequence_converges_iff_unique_subsequential_limit`** ← *(no book label found)*

### `Sequences/Scratch/Tails.lean`
- **def `MTail`** ← `def:m-tail`
- **theorem `convergence_of_tail`** ← `thm:convergence-of-tail`
- **theorem `convergence_by_domination`** ← `thm:convergence-by-domination`
- **theorem `ratio_limit_less_than_one_implies_null`** ← `thm:ratio-limit-less-than-one-implies-null`

## StructureOfRealLine

### `StructureOfRealLine/Scratch/Compactness.lean`
- **def `IsOpenCover`** ← `def:real-open-cover`
- **def `IsFiniteSubcover`** ← `def:finite-subcover`
- **def `IsCompactSet`** ← `def:compact-set`
- **theorem `compact_implies_closed_bounded`** ← `thm:compact-implies-closed-bounded`
- **theorem `closed_bounded_interval_compact`** ← `thm:closed-bounded-interval-compact`
- **theorem `isCompactSet_iff_isCompactR`** ← *(no book label found)*
- **theorem `isClosedSet_iff_isClosedR`** ← *(no book label found)*
- **theorem `heine_borel`** ← `thm:heine-borel`

### `StructureOfRealLine/Scratch/CompactnessAdditions.lean`
- **def `IsOpenR`** ← `def:open-set`
- **def `IsClosedR`** ← `def:closed-set`
- **def `IsCompactR`** ← `def:compact-set`
- **theorem `closed_subset_of_compact_is_compact`** ← `thm:heine-borel`, `thm:closed-bounded-interval-compact`
- **def `IsSeqCompactR`** ← *(no book label found)*
- **theorem `sequential_compactness_iff_open_cover_compactness`** ← *(no book label found)*

### `StructureOfRealLine/Scratch/OpenClosedSets.lean`
- **def `OpenBall`** ← `def:open-ball`
- **def `IsNeighborhood`** ← `def:neighborhood-of-point`
- **def `IsOpenSet`** ← `def:open-set`
- **theorem `open_interval_is_open`** ← `thm:open-interval-is-open`
- **theorem `open_set_closure_operations`** ← `thm:open-set-closure-operations`
- **def `IsClosedSet`** ← `def:closed-set`
- **theorem `closed_iff_contains_limit_points`** ← `thm:closed-iff-contains-limit-points`
- **def `IsInteriorPoint`** ← `def:interior-point`
- **def `IsExteriorPoint`** ← `def:exterior-point`
- **def `IsBoundaryPoint`** ← `def:boundary-point`
- **def `Interior'`** ← `def:interior-of-set`
- **def `IsLimitPoint`** ← `def:limit-point`
- **def `IsIsolatedPoint`** ← `def:isolated-point`
- **theorem `closed_set_closure_operations`** ← `thm:closed-set-closure-operations`

### `StructureOfRealLine/Scratch/OrderDistanceIntervals.lean`
- **def `dist'`** ← `def:distance-on-real-line`
- **def `IntervalLength`** ← `def:length-of-interval`
- **theorem `distance_is_a_metric`** ← `thm:distance-is-a-metric`
- **theorem `real_line_structural_order_facts`** ← `thm:real-line-structural-order-facts`
- **theorem `min_of_positive_is_positive`** ← `lem:minimum-of-positive-numbers-is-positive`
- **theorem `half_epsilon_is_positive`** ← `lem:half-epsilon-is-positive`
- **theorem `epsilon_splitting`** ← `lem:epsilon-splitting`
- **theorem `positive_minimum_bound`** ← `lem:positive-minimum-bound`
- **theorem `choosing_smaller_positive`** ← `lem:choosing-a-smaller-positive-number`
- **theorem `abs_is_distance_to_zero`** ← `prop:abs-value-is-distance-to-zero`
- **def `IsBoundedSubset`** ← `def:bounded-subset-of-r`
- **theorem `interval_set_ops_are_ordinary_set_ops`** ← `def:union-of-intervals`, `def:intersection-of-intervals`, `def:complement-of-interval`, `def:difference-of-intervals`
