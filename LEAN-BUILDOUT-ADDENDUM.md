# Lean Build-Out — Order & Conventions (Addendum)

A record of the decisions made during the Lean `sorry`-statement coverage pass
across `lra-lean`, kept alongside `ISSUES.md`, `ADDITIONS.md`, and
`LEAN_TEX_MAPPING.md` at the repo root — this is the "why it happened in this
order, under these rules" companion to those three tracking docs.

## Standing rules (apply to every chapter below)

- **Standalone / hooked-out.** Every file added lives under
  `LRA/VolumeIII/Analysis/<Chapter>/Scratch/` and does not import, and is not
  imported by, anything in the real wired project. Scratch files *within* a
  build-out pass may import each other (same chapter or cross-chapter) freely.
- **Statements only.** Every `theorem`/`def` ported from a book label gets a
  `sorry` body. Proof completion is explicitly out of scope for this pass —
  that's a separate, later effort, and is yours to run (`lake build`) and
  drive.
- **One file per book section.** Lean file layout mirrors the `.tex` section
  folder structure (e.g. `henstock-kurzweil/notes-henstock-kurzweil.tex` →
  `HenstockKurzweil.lean`), not an arbitrary grouping — so the mapping in
  `LEAN_TEX_MAPPING.md` stays legible file-by-file.
- **Fix, don't reproduce, live bugs.** Where the `.tex` source itself has a
  correctness bug (see `ISSUES.md`) that would force broken Lean — a
  predicate reused for two incompatible relations, a split predicate name for
  the same notion, a duplicated/garbled formula — the Lean port uses the
  *correct*, disambiguated version and documents the fix in the file's header
  comment, rather than encoding the bug faithfully. The `.tex` itself is never
  live-patched; that stays report-only in `ISSUES.md`.
- **Header provenance.** Every file opens with a
  `/- SCRATCH FILE — not wired into the lra-lean project. Source: ... -/`
  comment naming the `.tex` file it was built from and any bug fixes it makes.

## Why this order

The build-out wasn't done in book order — it followed where you flagged the
biggest confidence gaps first, then filled in what was left:

1. **Continuity, then Differentiation** (Ch.9*, Ch.10* — Book II). You raised
   this first, unprompted: uncertainty about whether continuity/differentiation
   were covered in Lean *at all*. Both turned out to be real gaps —
   Continuity had zero Lean presence, Differentiation likewise — so both were
   built from scratch, Continuity first per your explicit call.
2. **Structure of the Real Line, Functions, Sequences** (Ch.2, Ch.4*, Ch.6 —
   Book I). Named explicitly as the next batch. Structure of the Real Line had
   only the pre-existing `CompactnessAdditions.lean`; Functions and Sequences
   had empty/nonexistent `Scratch/` folders on the repo as first inspected,
   though full builds for both were later discovered already sitting
   locally (orphaned from earlier work never delivered) and were verified,
   then delivered/committed rather than redone.
3. **Integration** (Ch.11* — Book IV). Done last and differently from the
   rest: this chapter had never been content-audited at all (every other
   chapter had at least a prior correctness pass), so it got the full
   two-part treatment — a first-ever `ISSUES.md`/`ADDITIONS.md` audit *and*
   the Lean build-out together, specifically checking that each integral's
   Failure-modes content genuinely motivates the next integral in the
   historical chain (Cauchy → Riemann → Darboux → Riemann-Stieltjes →
   Henstock-Kurzweil → McShane) before porting it.

Discrete Calculus and Series remain skipped (deferred at your request,
standing from earlier in the audit); Function Sequences remains N/A (no
content yet in the book itself). Neither is part of this order — they simply
haven't been raised again.

## Chapter-by-chapter result

| Order | Chapter | Starting state | Files added | Scale |
|---|---|---|---|---|
| 1 | Continuity (Ch.9*) | Zero Lean presence | 8 new | ~43 nodes |
| 2 | Differentiation (Ch.10*) | Zero Lean presence | 10 new | ~50 nodes |
| 3 | Structure of the Real Line (Ch.2) | 1 pre-existing file only | 3 new (+1 pre-existing) | bridged into existing `IsOpenR`/`IsClosedR`/`IsCompactR` family |
| 3 | Functions (Ch.4*) | Empty `Scratch/` (later found populated locally, undelivered) | 10 (rescued + delivered) | ~149 statements / ~134 labels |
| 3 | Sequences (Ch.6) | No folder (later found populated locally, undelivered) | 15 (rescued + delivered) | ~188 statements / 151 labels |
| 4 | Integration (Ch.11*) | Never audited, zero Lean | 8 new | ~62 statements, first-ever content audit |

Full per-declaration detail is in `LEAN_TEX_MAPPING.md`; open issues found
along the way (including the ones deliberately fixed rather than reproduced
in Lean) are in `ISSUES.md`.

---

*Generated 2026-07-29 as a companion to `ISSUES.md`, `ADDITIONS.md`, and
`LEAN_TEX_MAPPING.md`. Not yet cross-checked against a `lake build`.*
