# p0-15 Verify Task

P0 title: Define canonical two in sqrt-two irrationality.

Repository: `F:/repos/lra-lean`
Inputs:
- `docs/p0-repair/prompts/p0-15-spec.md`
- the current ledger entry in `docs/p0-repair/ledger.json`

Task:
- Review the spec task output independently.
- Confirm the repair scope is mathematically coherent and implementation-complete.
- Confirm the proposed validator path and `lake build` target are sufficient for the success gate.
- Return either `approved` or a bounded correction list.

Constraints:
- Do not edit files.
- Do not implement code.
- Do not widen scope beyond what is required to make the spec correct.
