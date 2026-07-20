# Volume I Set Theory to Lean Foundation Crosswalk

Generated from `F:/repos/lra-volume-i/volume-i/book-sets` and compared against 
`LRA/Foundation` plus `LRA/VolumeI`.

This is a planning report. `represented` means an obvious declaration exists; 
`partial` means Lean has adjacent machinery but not the full book-level interface or theorem; 
`missing` means no clear mirror exists yet.

## Summary

- Book labels scanned: 228
- Lean declarations scanned: 400
- Represented: 68
- Partial: 49
- Missing: 111

### Labels by Subject

- `cardinality`: 10
- `functions`: 43
- `functions-and-order`: 25
- `orderings`: 61
- `relations`: 47
- `set-theory`: 42

## Immediate Foundation Priorities

1. Finish set algebra declarations and theorem statements: symmetric difference, monotone/antitone set operations, De Morgan, indexed distributivity, covers, subcovers, and finite-intersection property.
2. Expand relation algebra: identity/null/universal relations, relation inclusion/equality/Boolean operations, converse laws, composition laws, transitive/equivalence closures, and many-to-one/many-place classifications.
3. Add equivalence/quotient foundations: equivalence class, quotient set, index, canonical surjection, partition, representative independence, equivalence-partition theorem, and quotient universal property.
4. Split function foundations into total Lean functions and function-as-relation interfaces: functional relation, total-on-domain, partial function, graph, codomain, empty/inclusion/constant maps, inverse and one-sided inverse laws.
5. Add order interfaces from the book: ordered set variants, comparable/incomparable, bounds and extremal elements, order maps/isomorphisms, induced/suborders, sup/inf, lattices, order extensions, and Zorn/Hausdorff choice equivalents.
6. Add cardinality foundations: equipotence, finite/infinite, countable/uncountable, cardinal comparison, function spaces, Cantor, Schroeder-Bernstein, and countability theorems.

Dense-order requirements are not part of the Volume I set-theory inventory scanned here. They should be introduced where the number-system material needs them, then imported from a deliberately named order/number-system layer.

## Crosswalk

### cardinality

| Status | Label | Title | Book Source | Lean Candidates | Note |
|---|---|---|---|---|---|
| missing | `def:same-cardinality` | Same Cardinality | `cardinality/notes/cardinality/notes-cardinality.tex:20` | - | no obvious Lean declaration |
| partial | `def:finite-infinite` | Finite and Infinite Sets | `cardinality/notes/cardinality/notes-cardinality.tex:74` | - | related Lean support exists, but not the full book block |
| missing | `def:countable` | Countable and Uncountable Sets | `cardinality/notes/cardinality/notes-cardinality.tex:108` | - | no obvious Lean declaration |
| missing | `def:cardinality-order` | Comparing Cardinalities | `cardinality/notes/cardinality/notes-cardinality.tex:153` | - | no obvious Lean declaration |
| missing | `thm:Q-countable` | $\mathbb{Q}$ is countable | `cardinality/notes/cardinality/notes-cardinality.tex:195` | - | book-level theorem/proposition is not yet mirrored |
| missing | `thm:countable-union` | Countable Union of Countable Sets | `cardinality/notes/cardinality/notes-cardinality.tex:229` | - | book-level theorem/proposition is not yet mirrored |
| missing | `thm:R-uncountable` | $\mathbb{R}$ is uncountable | `cardinality/notes/cardinality/notes-cardinality.tex:271` | - | book-level theorem/proposition is not yet mirrored |
| missing | `thm:cantor` | Cantor's Theorem | `cardinality/notes/cardinality/notes-cardinality.tex:316` | - | book-level theorem/proposition is not yet mirrored |
| missing | `def:function-space` | Function Space $B^A$ | `cardinality/notes/cardinality/notes-cardinality.tex:364` | - | no obvious Lean declaration |
| missing | `thm:schroder-bernstein` | Schr\"{o}der--Bernstein Theorem | `cardinality/notes/cardinality/notes-cardinality.tex:411` | - | book-level theorem/proposition is not yet mirrored |

### functions

| Status | Label | Title | Book Source | Lean Candidates | Note |
|---|---|---|---|---|---|
| represented | `def:composition` | Composition | `functions/notes/functions/notes-composition.tex:12` | - | obvious Lean declaration exists in Foundation/VolumeI |
| missing | `thm:comp-assoc` | Associativity of Composition | `functions/notes/functions/notes-composition.tex:43` | - | book-level theorem/proposition is not yet mirrored |
| missing | `thm:comp-id` | Identity and Composition | `functions/notes/functions/notes-composition.tex:74` | - | book-level theorem/proposition is not yet mirrored |
| missing | `thm:comp-inj-surj` | Injectivity and Surjectivity Under Composition | `functions/notes/functions/notes-composition.tex:109` | - | book-level theorem/proposition is not yet mirrored |
| partial | `def:invertible-function` | Invertible Function | `functions/notes/functions/notes-composition.tex:161` | - | related Lean support exists, but not the full book block |
| partial | `def:inverse` | Inverse Function | `functions/notes/functions/notes-composition.tex:193` | `inverse` | related Lean support exists, but not the full book block |
| missing | `thm:inverse-char` | Characterization of Inverse Functions | `functions/notes/functions/notes-composition.tex:218` | - | book-level theorem/proposition is not yet mirrored |
| missing | `thm:inverse-comp` | Inverse of a Composition | `functions/notes/functions/notes-composition.tex:259` | - | book-level theorem/proposition is not yet mirrored |
| partial | `def:left-inverse-function` | Left Inverse | `functions/notes/functions/notes-composition.tex:291` | `leftInverse`, `leftInverse` | related Lean support exists, but not the full book block |
| partial | `def:right-inverse-function` | Right Inverse | `functions/notes/functions/notes-composition.tex:316` | `rightInverse`, `rightInverse` | related Lean support exists, but not the full book block |
| missing | `thm:one-sided` | One-Sided Inverses and Function Properties | `functions/notes/functions/notes-composition.tex:357` | - | book-level theorem/proposition is not yet mirrored |
| represented | `def:restriction` | Restriction | `functions/notes/functions/notes-composition.tex:409` | - | obvious Lean declaration exists in Foundation/VolumeI |
| missing | `def:fn-extension` | Extension | `functions/notes/functions/notes-composition.tex:433` | - | no obvious Lean declaration |
| missing | `thm:preimage-ops` | Preimages Preserve Set Operations | `functions/notes/functions/notes-composition.tex:478` | - | book-level theorem/proposition is not yet mirrored |
| missing | `thm:indexed-preimage-ops` | Preimages Preserve Indexed Set Operations | `functions/notes/functions/notes-composition.tex:524` | - | book-level theorem/proposition is not yet mirrored |
| missing | `thm:image-ops` | Images and Set Operations | `functions/notes/functions/notes-composition.tex:576` | - | book-level theorem/proposition is not yet mirrored |
| missing | `thm:image-preimage-adjunction` | Image--Preimage Adjunction | `functions/notes/functions/notes-composition.tex:618` | - | book-level theorem/proposition is not yet mirrored |
| missing | `prop:preimage-under-inverse-function` | Preimage Under an Inverse Function | `functions/notes/functions/notes-composition.tex:663` | - | book-level theorem/proposition is not yet mirrored |
| partial | `def:functional-relation` | Functional Relation | `functions/notes/functions/notes-functions.tex:22` | - | related Lean support exists, but not the full book block |
| partial | `def:total-relation-on-domain` | Total Relation on a Domain | `functions/notes/functions/notes-functions.tex:62` | - | related Lean support exists, but not the full book block |
| represented | `def:function` | Function | `functions/notes/functions/notes-functions.tex:98` | `Function`, `Function`, `Function` | obvious Lean declaration exists in Foundation/VolumeI |
| missing | `thm:function-total-functional-characterization` | Functional Relation Characterization of Functions | `functions/notes/functions/notes-functions.tex:155` | - | book-level theorem/proposition is not yet mirrored |
| partial | `def:partial-function` | Partial Function | `functions/notes/functions/notes-functions.tex:198` | - | related Lean support exists, but not the full book block |
| missing | `prop:partial-function-functional-relation` | Partial Functions Are Functional Relations | `functions/notes/functions/notes-functions.tex:225` | - | book-level theorem/proposition is not yet mirrored |
| partial | `def:function-equality` | Function Equality | `functions/notes/functions/notes-functions.tex:253` | - | related Lean support exists, but not the full book block |
| missing | `prop:one-to-many-not-functional` | One-to-Many Relations Are Not Functional | `functions/notes/functions/notes-functions.tex:294` | - | book-level theorem/proposition is not yet mirrored |
| represented | `def:domain` | Domain of a Function | `functions/notes/functions/notes-functions.tex:328` | `domain`, `domain` | obvious Lean declaration exists in Foundation/VolumeI |
| partial | `def:codomain` | Codomain of a Function | `functions/notes/functions/notes-functions.tex:353` | - | related Lean support exists, but not the full book block |
| represented | `def:image-function` | Image of a Function | `functions/notes/functions/notes-functions.tex:384` | - | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:image-set` | Image of a Set | `functions/notes/functions/notes-functions.tex:433` | - | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:preimage` | Preimage | `functions/notes/functions/notes-functions.tex:463` | `preimage` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:fiber` | Fiber | `functions/notes/functions/notes-functions.tex:515` | `fiber` | obvious Lean declaration exists in Foundation/VolumeI |
| partial | `def:graph` | Graph of a Function | `functions/notes/functions/notes-functions.tex:549` | - | related Lean support exists, but not the full book block |
| represented | `def:injective` | Injective Function | `functions/notes/functions/notes-functions.tex:590` | `injective` | obvious Lean declaration exists in Foundation/VolumeI |
| partial | `def:empty-function` | Empty Function | `functions/notes/functions/notes-functions.tex:627` | - | related Lean support exists, but not the full book block |
| represented | `def:surjective` | Surjective Function | `functions/notes/functions/notes-functions.tex:656` | `surjective` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:bijective` | Bijective Function | `functions/notes/functions/notes-functions.tex:692` | `bijective` | obvious Lean declaration exists in Foundation/VolumeI |
| missing | `prop:one-to-one-converse-functional` | One-One Relations and Converse Functionality | `functions/notes/functions/notes-functions.tex:723` | - | book-level theorem/proposition is not yet mirrored |
| missing | `prop:bijection-unique-both-directions` | Bijections Have Unique Correspondence Both Ways | `functions/notes/functions/notes-functions.tex:753` | - | book-level theorem/proposition is not yet mirrored |
| missing | `def:many-place-functional-relation` | Many-Place Functional Relation | `functions/notes/functions/notes-functions.tex:796` | - | no obvious Lean declaration |
| represented | `def:identity` | Identity Function | `functions/notes/functions/notes-functions.tex:843` | `identity`, `identity`, `identity`, `identity` | obvious Lean declaration exists in Foundation/VolumeI |
| partial | `def:inclusion` | Inclusion Map | `functions/notes/functions/notes-functions.tex:865` | - | related Lean support exists, but not the full book block |
| partial | `def:constant` | Constant Function | `functions/notes/functions/notes-functions.tex:894` | - | related Lean support exists, but not the full book block |

### functions-and-order

| Status | Label | Title | Book Source | Lean Candidates | Note |
|---|---|---|---|---|---|
| missing | `def:corestriction-to-image` | Corestriction to the Image | `functions-and-order/notes/changing-domains-and-codomains/notes-changing-domains-and-codomains.tex:28` | - | no obvious Lean declaration |
| missing | `prop:corestriction-surjective` | Corestriction Is Surjective | `functions-and-order/notes/changing-domains-and-codomains/notes-changing-domains-and-codomains.tex:72` | - | book-level theorem/proposition is not yet mirrored |
| missing | `prop:image-factorization` | Image Factorization | `functions-and-order/notes/changing-domains-and-codomains/notes-changing-domains-and-codomains.tex:105` | - | book-level theorem/proposition is not yet mirrored |
| missing | `prop:restriction-preserves-injective` | Domain Restriction Preserves Injectivity | `functions-and-order/notes/changing-domains-and-codomains/notes-changing-domains-and-codomains.tex:139` | - | book-level theorem/proposition is not yet mirrored |
| missing | `prop:enlarge-codomain-preserves-injective` | Enlarging Codomain Preserves Injectivity | `functions-and-order/notes/changing-domains-and-codomains/notes-changing-domains-and-codomains.tex:174` | - | book-level theorem/proposition is not yet mirrored |
| missing | `prop:restriction-preserves-monotonicity` | Restriction Preserves Monotonicity | `functions-and-order/notes/composition-and-failure-modes/notes-composition-and-failure-modes.tex:21` | - | book-level theorem/proposition is not yet mirrored |
| missing | `prop:composition-order-embeddings` | Composition of Order Embeddings | `functions-and-order/notes/composition-and-failure-modes/notes-composition-and-failure-modes.tex:51` | - | book-level theorem/proposition is not yet mirrored |
| missing | `thm:fo-synthesis` | Chapter Synthesis | `functions-and-order/notes/composition-and-failure-modes/notes-composition-and-failure-modes.tex:105` | - | book-level theorem/proposition is not yet mirrored |
| missing | `def:upper-lower-set` | Upper and Lower Set | `functions-and-order/notes/images-preimages-and-bounds/notes-images-preimages-and-bounds.tex:5` | - | no obvious Lean declaration |
| missing | `def:bounded-image` | Bounded Image | `functions-and-order/notes/images-preimages-and-bounds/notes-images-preimages-and-bounds.tex:66` | - | no obvious Lean declaration |
| missing | `prop:boundedness-image-boundedness` | Boundedness Is Image Boundedness | `functions-and-order/notes/images-preimages-and-bounds/notes-images-preimages-and-bounds.tex:105` | - | book-level theorem/proposition is not yet mirrored |
| missing | `thm:preimage-upper-lower-sets` | Preimages of Upper and Lower Sets | `functions-and-order/notes/images-preimages-and-bounds/notes-images-preimages-and-bounds.tex:146` | - | book-level theorem/proposition is not yet mirrored |
| missing | `prop:images-chains-monotone` | Images of Chains Under Monotone Maps | `functions-and-order/notes/images-preimages-and-bounds/notes-images-preimages-and-bounds.tex:188` | - | book-level theorem/proposition is not yet mirrored |
| partial | `def:strictly-monotone-map-functions-order` | Strictly Monotone Map | `functions-and-order/notes/monotone-and-antitone-maps/notes-monotone-and-antitone-maps.tex:20` | - | related Lean support exists, but not the full book block |
| missing | `prop:constant-maps-monotone` | Constant Maps Are Monotone | `functions-and-order/notes/monotone-and-antitone-maps/notes-monotone-and-antitone-maps.tex:75` | - | book-level theorem/proposition is not yet mirrored |
| missing | `thm:strict-monotone-injective-linear` | Strict Monotonicity Implies Injectivity on Linear Orders | `functions-and-order/notes/monotone-and-antitone-maps/notes-monotone-and-antitone-maps.tex:110` | - | book-level theorem/proposition is not yet mirrored |
| missing | `thm:monotone-composition-rules` | Composition Rules for Monotonicity | `functions-and-order/notes/monotone-and-antitone-maps/notes-monotone-and-antitone-maps.tex:150` | - | book-level theorem/proposition is not yet mirrored |
| represented | `def:order-reflecting-map` | Order-Reflecting Map | `functions-and-order/notes/order-embeddings-and-isomorphisms/notes-order-embeddings-and-isomorphisms.tex:5` | - | obvious Lean declaration exists in Foundation/VolumeI |
| missing | `def:order-embedding-function-form` | Order Embedding, Function-Property Form | `functions-and-order/notes/order-embeddings-and-isomorphisms/notes-order-embeddings-and-isomorphisms.tex:50` | - | no obvious Lean declaration |
| partial | `prop:order-embedding-injective-revisited` | Order Embeddings Are Injective, Revisited | `functions-and-order/notes/order-embeddings-and-isomorphisms/notes-order-embeddings-and-isomorphisms.tex:83` | - | related Lean support exists, but not the full book block |
| missing | `thm:order-embedding-isomorphism-onto-image` | Order Embedding Is Isomorphism Onto Image | `functions-and-order/notes/order-embeddings-and-isomorphisms/notes-order-embeddings-and-isomorphisms.tex:117` | - | book-level theorem/proposition is not yet mirrored |
| missing | `thm:inverse-order-isomorphism` | Inverse of an Order Isomorphism | `functions-and-order/notes/order-embeddings-and-isomorphisms/notes-order-embeddings-and-isomorphisms.tex:149` | - | book-level theorem/proposition is not yet mirrored |
| missing | `thm:injective-bijection-onto-image` | Injective Maps Are Bijections Onto Their Images | `functions-and-order/notes/restrictions-and-inverses/notes-restrictions-and-inverses.tex:12` | - | book-level theorem/proposition is not yet mirrored |
| missing | `prop:restricted-map-onto-image` | Restricted Map Is Onto Its Restricted Image | `functions-and-order/notes/restrictions-and-inverses/notes-restrictions-and-inverses.tex:51` | - | book-level theorem/proposition is not yet mirrored |
| missing | `prop:injective-restriction-local-inverse` | Injective Restriction Gives a Local Inverse | `functions-and-order/notes/restrictions-and-inverses/notes-restrictions-and-inverses.tex:87` | - | book-level theorem/proposition is not yet mirrored |

### orderings

| Status | Label | Title | Book Source | Lean Candidates | Note |
|---|---|---|---|---|---|
| missing | `def:sym-asym` | Symmetric and Asymmetric Parts | `orderings/notes/order/notes-order-extensions.tex:13` | - | no obvious Lean declaration |
| missing | `def:maximal-upper` | Maximal Elements and Upper Bounds | `orderings/notes/order/notes-order-extensions.tex:75` | - | no obvious Lean declaration |
| missing | `def:preorder-extension` | Extension of a Preorder | `orderings/notes/order/notes-order-extensions.tex:137` | - | no obvious Lean declaration |
| missing | `thm:szpilrajn` | Szpilrajn Extension Theorem | `orderings/notes/order/notes-order-extensions.tex:185` | - | book-level theorem/proposition is not yet mirrored |
| missing | `cor:complete-preorder-extension` | Complete Preorder Extension | `orderings/notes/order/notes-order-extensions.tex:231` | - | book-level theorem/proposition is not yet mirrored |
| missing | `def:owc` | Only Weak Cycles | `orderings/notes/order/notes-order-extensions.tex:275` | - | no obvious Lean declaration |
| missing | `prop:owc-characterization` | Only Weak Cycles Characterization | `orderings/notes/order/notes-order-extensions.tex:315` | - | book-level theorem/proposition is not yet mirrored |
| missing | `def:cover-relation` | Cover Relation | `orderings/notes/order/notes-order-hasse-sup-duality.tex:26` | - | no obvious Lean declaration |
| missing | `def:hasse` | Hasse Diagram | `orderings/notes/order/notes-order-hasse-sup-duality.tex:72` | - | no obvious Lean declaration |
| missing | `def:dual-poset` | Dual Poset | `orderings/notes/order/notes-order-hasse-sup-duality.tex:166` | - | no obvious Lean declaration |
| missing | `prop:order-duality` | - | `orderings/notes/order/notes-order-hasse-sup-duality.tex:209` | - | book-level theorem/proposition is not yet mirrored |
| partial | `def:induced-order` | Induced Order | `orderings/notes/order/notes-order-induced.tex:21` | - | related Lean support exists, but not the full book block |
| missing | `prop:induced-preorder` | \texorpdfstring{\hyperref[prf:induced-preorder | `orderings/notes/order/notes-order-induced.tex:66` | - | book-level theorem/proposition is not yet mirrored |
| missing | `def:f-indist` | $f$-Indistinguishable Elements | `orderings/notes/order/notes-order-induced.tex:108` | - | no obvious Lean declaration |
| missing | `prop:induced-poset` | \texorpdfstring{\hyperref[prf:induced-poset | `orderings/notes/order/notes-order-induced.tex:148` | - | book-level theorem/proposition is not yet mirrored |
| partial | `def:suborder` | Suborder / Restriction | `orderings/notes/order/notes-order-induced.tex:204` | - | related Lean support exists, but not the full book block |
| represented | `def:order-embedding` | Order Embedding | `orderings/notes/order/notes-order-induced.tex:249` | `orderEmbedding` | obvious Lean declaration exists in Foundation/VolumeI |
| missing | `prop:embedding-injective` | Order embeddings are injective | `orderings/notes/order/notes-order-induced.tex:301` | - | book-level theorem/proposition is not yet mirrored |
| missing | `prop:embedding-iso` | Order embedding is isomorphism onto image | `orderings/notes/order/notes-order-induced.tex:336` | - | book-level theorem/proposition is not yet mirrored |
| missing | `def:lattice` | Lattice | `orderings/notes/order/notes-order-lattices.tex:48` | - | no obvious Lean declaration |
| missing | `def:complete-lattice` | Complete Lattice | `orderings/notes/order/notes-order-lattices.tex:130` | - | no obvious Lean declaration |
| missing | `def:distributive-lattice` | Distributive Lattice | `orderings/notes/order/notes-order-lattices.tex:205` | - | no obvious Lean declaration |
| missing | `def:boolean-lattice` | Complement and Boolean Lattice | `orderings/notes/order/notes-order-lattices.tex:254` | - | no obvious Lean declaration |
| missing | `thm:knaster-tarski` | Knaster--Tarski Fixed-Point Theorem | `orderings/notes/order/notes-order-lattices.tex:338` | - | book-level theorem/proposition is not yet mirrored |
| missing | `def:sup-inf` | Supremum and Infimum | `orderings/notes/order/notes-order-sup-inf.tex:64` | - | no obvious Lean declaration |
| missing | `prop:sup-unique` | - | `orderings/notes/order/notes-order-sup-inf.tex:133` | - | book-level theorem/proposition is not yet mirrored |
| missing | `prop:sup-char` | - | `orderings/notes/order/notes-order-sup-inf.tex:254` | - | book-level theorem/proposition is not yet mirrored |
| missing | `prop:sup-inf-duality` | - | `orderings/notes/order/notes-order-sup-inf.tex:308` | - | book-level theorem/proposition is not yet mirrored |
| represented | `def:ordered-set` | Ordered Set | `orderings/notes/order/notes-order.tex:12` | - | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:partially-ordered-set` | Partially Ordered Set | `orderings/notes/order/notes-order.tex:50` | - | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:poset` | Poset | `orderings/notes/order/notes-order.tex:84` | - | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:toset` | Toset | `orderings/notes/order/notes-order.tex:109` | `toSet` | obvious Lean declaration exists in Foundation/VolumeI |
| missing | `def:loset` | Loset | `orderings/notes/order/notes-order.tex:134` | - | no obvious Lean declaration |
| missing | `def:woset` | Woset | `orderings/notes/order/notes-order.tex:161` | - | no obvious Lean declaration |
| represented | `def:strict-order` | Strict Order | `orderings/notes/order/notes-order.tex:186` | `strictOrder`, `StrictOrder`, `strictOrder` | obvious Lean declaration exists in Foundation/VolumeI |
| missing | `def:non-strict-order-induced-by-strict-order` | Non-Strict Order Induced by a Strict Order | `orderings/notes/order/notes-order.tex:223` | - | no obvious Lean declaration |
| missing | `thm:strict-order-induced-by-linear-order` | Strict Order Induced by a Linear Order | `orderings/notes/order/notes-order.tex:252` | - | book-level theorem/proposition is not yet mirrored |
| missing | `thm:linear-order-induced-by-strict-linear-order` | Linear Order Induced by a Strict Linear Order | `orderings/notes/order/notes-order.tex:287` | - | book-level theorem/proposition is not yet mirrored |
| missing | `thm:trichotomy-for-linear-orders` | Trichotomy for Linear Orders | `orderings/notes/order/notes-order.tex:322` | - | book-level theorem/proposition is not yet mirrored |
| partial | `def:comparable` | Comparable Elements | `orderings/notes/order/notes-order.tex:362` | - | related Lean support exists, but not the full book block |
| partial | `def:incomparable` | Incomparable Elements | `orderings/notes/order/notes-order.tex:389` | - | related Lean support exists, but not the full book block |
| missing | `def:totally-ordered-set` | Totally Ordered Set | `orderings/notes/order/notes-order.tex:422` | - | no obvious Lean declaration |
| partial | `def:upper-bound` | Upper Bound | `orderings/notes/order/notes-order.tex:462` | - | related Lean support exists, but not the full book block |
| partial | `def:lower-bound` | Lower Bound | `orderings/notes/order/notes-order.tex:492` | - | related Lean support exists, but not the full book block |
| partial | `def:order-minimal-element` | Minimal Element | `orderings/notes/order/notes-order.tex:527` | - | related Lean support exists, but not the full book block |
| partial | `def:order-maximal-element` | Maximal Element | `orderings/notes/order/notes-order.tex:557` | - | related Lean support exists, but not the full book block |
| partial | `def:order-least-element` | Least Element | `orderings/notes/order/notes-order.tex:587` | - | related Lean support exists, but not the full book block |
| partial | `def:order-greatest-element` | Greatest Element | `orderings/notes/order/notes-order.tex:618` | - | related Lean support exists, but not the full book block |
| partial | `def:order-preserving-map-ordered-sets` | Order-Preserving Map | `orderings/notes/order/notes-order.tex:658` | - | related Lean support exists, but not the full book block |
| partial | `def:order-reversing-map` | Order-Reversing Map | `orderings/notes/order/notes-order.tex:698` | - | related Lean support exists, but not the full book block |
| partial | `def:order-isomorphism-ordered-sets` | Order Isomorphism | `orderings/notes/order/notes-order.tex:732` | - | related Lean support exists, but not the full book block |
| missing | `thm:order-isomorphisms-preserve-and-reflect-order` | Order Isomorphisms Preserve and Reflect Order | `orderings/notes/order/notes-order.tex:775` | - | book-level theorem/proposition is not yet mirrored |
| partial | `def:well-ordered-set` | Well-Ordered Set | `orderings/notes/order/notes-order.tex:814` | - | related Lean support exists, but not the full book block |
| missing | `def:order-chain` | Chain | `orderings/notes/order/notes-order.tex:870` | - | no obvious Lean declaration |
| missing | `def:order-antichain` | Antichain | `orderings/notes/order/notes-order.tex:900` | - | no obvious Lean declaration |
| missing | `def:initial-segment` | Initial Segment | `orderings/notes/order/notes-order.tex:930` | - | no obvious Lean declaration |
| missing | `def:directed-set` | Directed Set | `orderings/notes/order/notes-order.tex:970` | - | no obvious Lean declaration |
| missing | `def:net` | Net | `orderings/notes/order/notes-order.tex:1025` | - | no obvious Lean declaration |
| missing | `thm:ac-alternative-forms` | - | `orderings/notes/zorn/notes-zorn.tex:25` | - | book-level theorem/proposition is not yet mirrored |
| missing | `thm:zorn` | - | `orderings/notes/zorn/notes-zorn.tex:75` | - | book-level theorem/proposition is not yet mirrored |
| missing | `thm:hausdorff` | - | `orderings/notes/zorn/notes-zorn.tex:120` | - | book-level theorem/proposition is not yet mirrored |

### relations

| Status | Label | Title | Book Source | Lean Candidates | Note |
|---|---|---|---|---|---|
| missing | `def:equiv-class` | Equivalence Class | `relations/notes/equivalence/notes-equivalence.tex:12` | - | no obvious Lean declaration |
| partial | `def:quotient-set` | Quotient Set | `relations/notes/equivalence/notes-equivalence.tex:58` | - | related Lean support exists, but not the full book block |
| missing | `def:index` | Index of an Equivalence Relation | `relations/notes/equivalence/notes-equivalence.tex:95` | - | no obvious Lean declaration |
| partial | `def:canonical-surj` | Canonical Surjection | `relations/notes/equivalence/notes-equivalence.tex:117` | - | related Lean support exists, but not the full book block |
| missing | `def:partition` | Partition | `relations/notes/equivalence/notes-equivalence.tex:170` | - | no obvious Lean declaration |
| missing | `lem:rep-independence` | Representative Independence Lemma | `relations/notes/equivalence/notes-equivalence.tex:233` | - | book-level theorem/proposition is not yet mirrored |
| missing | `thm:equiv-partition` | Equivalence Relations and Partitions | `relations/notes/equivalence/notes-equivalence.tex:278` | - | book-level theorem/proposition is not yet mirrored |
| missing | `thm:quotient-universal` | - | `relations/notes/equivalence/notes-equivalence.tex:353` | - | book-level theorem/proposition is not yet mirrored |
| represented | `def:reflexive` | Reflexive Relation | `relations/notes/relations/notes-relation-properties.tex:15` | `reflexive`, `reflexive` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:irreflexive` | Irreflexive Relation | `relations/notes/relations/notes-relation-properties.tex:63` | `irreflexive`, `irreflexive` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:symmetric` | Symmetric Relation | `relations/notes/relations/notes-relation-properties.tex:123` | `symmetric`, `symmetric` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:antisymmetric` | Antisymmetric Relation | `relations/notes/relations/notes-relation-properties.tex:170` | `antisymmetric`, `antisymmetric` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:asymmetric` | Asymmetric Relation | `relations/notes/relations/notes-relation-properties.tex:219` | `asymmetric`, `asymmetric` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:transitive` | Transitive Relation | `relations/notes/relations/notes-relation-properties.tex:275` | `transitive`, `transitive` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:total-rel` | Total (Connex) Relation | `relations/notes/relations/notes-relation-properties.tex:325` | - | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:equivalence-rel` | Equivalence Relation | `relations/notes/relations/notes-relation-properties.tex:367` | `EquivalenceRelation` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:preorder` | Preorder | `relations/notes/relations/notes-relation-properties.tex:412` | `preorder`, `Preorder`, `preorder` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:partial-order` | Partial Order | `relations/notes/relations/notes-relation-properties.tex:448` | `partialOrder`, `PartialOrder`, `partialOrder` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:strict-partial-order-relations` | Strict Partial Order | `relations/notes/relations/notes-relation-properties.tex:488` | `StrictPartialOrder` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:total-order` | Total Order | `relations/notes/relations/notes-relation-properties.tex:542` | `totalOrder`, `TotalOrder`, `totalOrder` | obvious Lean declaration exists in Foundation/VolumeI |
| partial | `def:ordered-pair` | Ordered Pair | `relations/notes/relations/notes-relations.tex:18` | - | related Lean support exists, but not the full book block |
| missing | `thm:ordered-pair-unique` | Uniqueness of Ordered Pairs | `relations/notes/relations/notes-relations.tex:54` | - | book-level theorem/proposition is not yet mirrored |
| partial | `def:cartesian-product-rel` | Cartesian Product --- as foundation for relations | `relations/notes/relations/notes-relations.tex:102` | - | related Lean support exists, but not the full book block |
| represented | `def:relation` | Relation | `relations/notes/relations/notes-relations.tex:145` | - | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:relation-domain` | Domain of a Relation | `relations/notes/relations/notes-relations.tex:194` | - | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:relation-range` | Range of a Relation | `relations/notes/relations/notes-relations.tex:234` | - | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:converse-relation` | Converse Relation | `relations/notes/relations/notes-relations.tex:280` | - | obvious Lean declaration exists in Foundation/VolumeI |
| partial | `def:relation-identity` | Identity Relation | `relations/notes/relations/notes-relations.tex:321` | - | related Lean support exists, but not the full book block |
| represented | `def:relation-composition` | Composition of Relations | `relations/notes/relations/notes-relations.tex:361` | - | obvious Lean declaration exists in Foundation/VolumeI |
| missing | `thm:relation-composition-assoc` | Associativity of Relation Composition | `relations/notes/relations/notes-relations.tex:402` | - | book-level theorem/proposition is not yet mirrored |
| missing | `thm:relation-composition-id` | Identity Laws for Relation Composition | `relations/notes/relations/notes-relations.tex:432` | - | book-level theorem/proposition is not yet mirrored |
| missing | `def:null-relation` | Null Relation | `relations/notes/relations/notes-relations.tex:466` | - | no obvious Lean declaration |
| partial | `def:universal-relation` | Universal Relation | `relations/notes/relations/notes-relations.tex:502` | - | related Lean support exists, but not the full book block |
| partial | `def:relation-inclusion` | Relation Inclusion | `relations/notes/relations/notes-relations.tex:541` | - | related Lean support exists, but not the full book block |
| partial | `def:relation-equality` | Relation Equality | `relations/notes/relations/notes-relations.tex:580` | - | related Lean support exists, but not the full book block |
| partial | `def:relation-union` | Union of Relations | `relations/notes/relations/notes-relations.tex:623` | - | related Lean support exists, but not the full book block |
| partial | `def:relation-intersection` | Intersection of Relations | `relations/notes/relations/notes-relations.tex:663` | - | related Lean support exists, but not the full book block |
| partial | `def:relation-difference` | Difference of Relations | `relations/notes/relations/notes-relations.tex:704` | - | related Lean support exists, but not the full book block |
| partial | `def:relation-complement` | Complement of a Relation | `relations/notes/relations/notes-relations.tex:745` | - | related Lean support exists, but not the full book block |
| missing | `thm:relation-converse-laws` | Converse Laws for Relation Operations | `relations/notes/relations/notes-relations.tex:789` | - | book-level theorem/proposition is not yet mirrored |
| missing | `thm:relation-composition-boolean` | Relation Composition and Boolean Operations | `relations/notes/relations/notes-relations.tex:845` | - | book-level theorem/proposition is not yet mirrored |
| missing | `def:relation-transitive-closure` | Transitive Closure | `relations/notes/relations/notes-relations.tex:931` | - | no obvious Lean declaration |
| missing | `def:relation-equivalence-closure` | Equivalence Closure | `relations/notes/relations/notes-relations.tex:972` | - | no obvious Lean declaration |
| missing | `def:one-to-many-relation` | One-to-Many Relation | `relations/notes/relations/notes-relations.tex:1013` | - | no obvious Lean declaration |
| missing | `def:many-to-one-relation` | Many-to-One Relation | `relations/notes/relations/notes-relations.tex:1049` | - | no obvious Lean declaration |
| missing | `def:many-to-many-relation` | Many-to-Many Relation | `relations/notes/relations/notes-relations.tex:1085` | - | no obvious Lean declaration |
| missing | `def:many-place-relation` | Many-Place Relation | `relations/notes/relations/notes-relations.tex:1135` | - | no obvious Lean declaration |

### set-theory

| Status | Label | Title | Book Source | Lean Candidates | Note |
|---|---|---|---|---|---|
| represented | `def:cover-full` | Cover | `set-theory/notes/families/notes-covers-fip.tex:27` | - | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:subcover` | Subcover | `set-theory/notes/families/notes-covers-fip.tex:65` | `subcover`, `subcover`, `subcover` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:finite-cover` | Finite Cover | `set-theory/notes/families/notes-covers-fip.tex:93` | `finiteCover`, `finiteCover`, `finiteCover` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:open-cover` | Open Cover | `set-theory/notes/families/notes-covers-fip.tex:136` | `openCover`, `openCover`, `openCover` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:fip` | Finite Intersection Property | `set-theory/notes/families/notes-covers-fip.tex:186` | `finiteIntersectionProperty`, `finiteIntersectionProperty`, `finiteIntersectionProperty` | obvious Lean declaration exists in Foundation/VolumeI |
| partial | `prop:fip-duality` | FIP--Cover Duality | `set-theory/notes/families/notes-covers-fip.tex:251` | - | related Lean support exists, but not the full book block |
| represented | `def:indexed-family` | Indexed Family of Sets | `set-theory/notes/families/notes-families.tex:19` | - | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:indexed-union` | Indexed Union | `set-theory/notes/families/notes-families.tex:55` | `indexedUnion`, `indexed_de_morgan_union`, `indexed_intersection_union_distributes_left`, `indexed_union_intersection_distributes_left` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:indexed-intersection` | Indexed Intersection | `set-theory/notes/families/notes-families.tex:107` | `indexedIntersection`, `indexed_de_morgan_intersection`, `indexed_intersection_union_distributes_left`, `indexed_union_intersection_distributes_left` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `thm:indexed-de-morgan` | De Morgan's Laws for Indexed Families | `set-theory/notes/families/notes-families.tex:166` | `de_morgan_union`, `de_morgan_intersection`, `indexed_de_morgan_union`, `indexed_de_morgan_intersection` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `thm:indexed-distributivity` | Distributive Laws for Indexed Families | `set-theory/notes/families/notes-families.tex:211` | - | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:pairwise-disjoint` | Pairwise Disjoint Family | `set-theory/notes/families/notes-families.tex:258` | - | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:set-cover` | Cover | `set-theory/notes/families/notes-families.tex:296` | - | obvious Lean declaration exists in Foundation/VolumeI |
| missing | `def:arbitrary-product` | Arbitrary Cartesian Product | `set-theory/notes/families/notes-families.tex:335` | - | no obvious Lean declaration |
| represented | `def:set-membership` | Set and Membership | `set-theory/notes/sets/notes-foundations.tex:350` | - | obvious Lean declaration exists in Foundation/VolumeI |
| partial | `thm:commutativity` | Commutativity of Union and Intersection | `set-theory/notes/sets/notes-set-algebra.tex:20` | `intersection_union_distributes_left`, `indexed_intersection_union_distributes_left`, `indexed_union_intersection_distributes_left` | related Lean support exists, but not the full book block |
| partial | `thm:associativity` | Associativity of Union and Intersection | `set-theory/notes/sets/notes-set-algebra.tex:56` | `intersection_union_distributes_left`, `indexed_intersection_union_distributes_left`, `indexed_union_intersection_distributes_left` | related Lean support exists, but not the full book block |
| partial | `thm:distributivity` | Distributive Laws | `set-theory/notes/sets/notes-set-algebra.tex:92` | - | related Lean support exists, but not the full book block |
| partial | `thm:identity-absorption` | Identity and Absorption Laws | `set-theory/notes/sets/notes-set-algebra.tex:129` | - | related Lean support exists, but not the full book block |
| partial | `thm:involution` | Involution of Complement | `set-theory/notes/sets/notes-set-algebra.tex:178` | - | related Lean support exists, but not the full book block |
| represented | `def:empty-set` | Empty Set | `set-theory/notes/sets/notes-set-operations.tex:15` | - | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:subset` | Subset | `set-theory/notes/sets/notes-set-operations.tex:58` | `subset`, `subset` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:proper-subset` | Proper Subset | `set-theory/notes/sets/notes-set-operations.tex:96` | `properSubset` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:set-equality` | Set Equality | `set-theory/notes/sets/notes-set-operations.tex:135` | - | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:union` | Union | `set-theory/notes/sets/notes-set-operations.tex:183` | `union`, `union`, `intersection_union_distributes_left`, `union_commutative` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:intersection` | Intersection | `set-theory/notes/sets/notes-set-operations.tex:220` | `intersection`, `intersection`, `intersection_union_distributes_left`, `intersection_commutative` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:set-difference` | Set Difference | `set-theory/notes/sets/notes-set-operations.tex:257` | `set_difference_monotone_left`, `set_difference_antitone_right` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:sym-diff` | Symmetric Difference | `set-theory/notes/sets/notes-set-operations.tex:294` | `symmetricDifference`, `symmetricDifference` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:complement` | Complement | `set-theory/notes/sets/notes-set-operations.tex:345` | `complement`, `complement`, `complement_antitone_inclusion` | obvious Lean declaration exists in Foundation/VolumeI |
| partial | `def:cartesian-product` | Cartesian Product | `set-theory/notes/sets/notes-set-operations.tex:381` | `cartesianProduct` | related Lean support exists, but not the full book block |
| represented | `def:power-set` | Power Set | `set-theory/notes/sets/notes-set-operations.tex:431` | `powerSet`, `powerSet`, `power_set_monotone_inclusion` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:inclusion-monotone-set-operation` | Inclusion-Monotone Set Operation | `set-theory/notes/sets/notes-set-operations.tex:473` | `union_monotone_inclusion`, `intersection_monotone_inclusion`, `power_set_monotone_inclusion`, `set_difference_monotone_left` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `def:inclusion-antitone-set-operation` | Inclusion-Antitone Set Operation | `set-theory/notes/sets/notes-set-operations.tex:508` | `power_set_monotone_inclusion`, `complement_antitone_inclusion`, `set_difference_antitone_right` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `thm:union-monotone-inclusion` | Union is Inclusion-Monotone | `set-theory/notes/sets/notes-set-operations.tex:542` | `union_monotone_inclusion`, `intersection_monotone_inclusion`, `power_set_monotone_inclusion` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `thm:intersection-monotone-inclusion` | Intersection is Inclusion-Monotone | `set-theory/notes/sets/notes-set-operations.tex:591` | `union_monotone_inclusion`, `intersection_monotone_inclusion`, `power_set_monotone_inclusion` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `thm:power-set-monotone-inclusion` | Power Set is Inclusion-Monotone | `set-theory/notes/sets/notes-set-operations.tex:631` | `union_monotone_inclusion`, `intersection_monotone_inclusion`, `power_set_monotone_inclusion`, `set_difference_monotone_left` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `thm:complement-antitone-inclusion` | Complement is Inclusion-Antitone | `set-theory/notes/sets/notes-set-operations.tex:666` | `complement_antitone_inclusion` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `thm:set-difference-monotone-left` | Set Difference is Inclusion-Monotone in the Left Argument | `set-theory/notes/sets/notes-set-operations.tex:702` | `union_monotone_inclusion`, `intersection_monotone_inclusion`, `power_set_monotone_inclusion`, `set_difference_monotone_left` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `thm:set-difference-antitone-right` | Set Difference is Inclusion-Antitone in the Right Argument | `set-theory/notes/sets/notes-set-operations.tex:737` | `power_set_monotone_inclusion`, `complement_antitone_inclusion`, `set_difference_monotone_left`, `set_difference_antitone_right` | obvious Lean declaration exists in Foundation/VolumeI |
| represented | `thm:de-morgan` | De Morgan's Laws | `set-theory/notes/sets/notes-set-operations.tex:775` | `de_morgan_union`, `de_morgan_intersection`, `indexed_de_morgan_union`, `indexed_de_morgan_intersection` | obvious Lean declaration exists in Foundation/VolumeI |
| missing | `def:set-duality` | Set Duality | `set-theory/notes/sets/notes-set-operations.tex:820` | - | no obvious Lean declaration |
| missing | `cor:set-duality` | \texorpdfstring{\hyperref[prf:set-duality | `set-theory/notes/sets/notes-set-operations.tex:858` | - | book-level theorem/proposition is not yet mirrored |

