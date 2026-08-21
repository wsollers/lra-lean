from __future__ import annotations

from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]

# Ordered longest-first. Module import names deliberately remain curricular;
# only declaration/reference text is rewritten.
REPLACEMENTS = [
    ("open LRA.Analysis.Bounds.Extrema (IsSupremum IsInfimum)",
     "open LRA.Analysis.Bounds (IsSupremum IsInfimum)"),
    ("open LRA.Analysis.Bounds.Extrema\n", "open LRA.Analysis.Bounds.Extrema\nopen LRA.Analysis.Bounds\n"),
    ("LRA.Analysis.Bounds.Extrema.IsUpperBound", "LRA.Analysis.Bounds.IsUpperBound"),
    ("LRA.Analysis.Bounds.Extrema.IsLowerBound", "LRA.Analysis.Bounds.IsLowerBound"),
    ("LRA.Analysis.Bounds.Extrema.IsBoundedAbove", "LRA.Analysis.Bounds.IsBoundedAbove"),
    ("LRA.Analysis.Bounds.Extrema.IsBoundedBelow", "LRA.Analysis.Bounds.IsBoundedBelow"),
    ("LRA.Analysis.Bounds.Extrema.IsBounded", "LRA.Analysis.Bounds.IsBounded"),
    ("LRA.Analysis.Bounds.Extrema.IsMaximum", "LRA.Analysis.Bounds.IsMaximum"),
    ("LRA.Analysis.Bounds.Extrema.IsMinimum", "LRA.Analysis.Bounds.IsMinimum"),
    ("LRA.Analysis.Bounds.Extrema.IsSupremum", "LRA.Analysis.Bounds.IsSupremum"),
    ("LRA.Analysis.Bounds.Extrema.IsInfimum", "LRA.Analysis.Bounds.IsInfimum"),
    ("LRA.Analysis.Bounding.BoundAlgebra", "LRA.Analysis.Bounds.Algebra"),
    ("LRA.Analysis.Bounding.ExtremalBounds", "LRA.Analysis.Bounds.Extrema"),
    ("LRA.Analysis.Bounding.Bounds", "LRA.Analysis.Bounds"),
    ("LRA.Analysis.Bounding", "LRA.Analysis.Bounds"),
    ("LRA.VolumeVII.WithMathlib.ScratchMetricSpace", "LRA.Internal.ScratchMetricSpace"),
    ("LRA.VolumeI.AlgebraicStructures", "LRA.AlgebraicStructures"),
    ("LRA.VolumeI.Operations", "LRA.Operation"),
    ("LRA.VolumeI.Relations", "LRA.Relation"),
    ("LRA.VolumeI.Identity", "LRA.Identity"),
    ("LRA.VolumeI.Logic", "LRA.Logic"),
    ("LRA.VolumeI.Order", "LRA.Order"),
    ("LRA.VolumeI.UniversalAlgebra", "LRA.UniversalAlgebra"),
    ("LRA.VolumeI.Set", "LRA.Set"),
    ("LRA.VolumeII.BasicArithmetic", "LRA.NumberSystems.Arithmetic"),
    ("LRA.VolumeII.ComplexNumbers", "LRA.NumberSystems.ComplexNumbers"),
    ("LRA.VolumeII.Foundations", "LRA.NumberSystems.Foundations"),
    ("LRA.VolumeII.GaussianIntegers", "LRA.NumberSystems.GaussianIntegers"),
    ("LRA.VolumeII.Integers", "LRA.NumberSystems.Integers"),
    ("LRA.VolumeII.NaturalNumbers", "LRA.NumberSystems.NaturalNumbers"),
    ("LRA.VolumeII.PeanoSystems", "LRA.NumberSystems.PeanoSystems"),
    ("LRA.VolumeII.RationalNumbers", "LRA.NumberSystems.RationalNumbers"),
    ("LRA.VolumeII.RealNumbers", "LRA.NumberSystems.RealNumbers"),
    ("LRA.VolumeII.WholeNumbers", "LRA.NumberSystems.WholeNumbers"),
    ("LRA.VolumeIII.RealNumbers", "LRA.NumberSystems.RealNumbers"),
    ("LRA.VolumeIV.AlgebrasOfSets", "LRA.Set.Algebra"),
    ("LRA.VolumeIV.BanachSpaces", "LRA.Analysis.FunctionalAnalysis.BanachSpaces"),
    ("LRA.VolumeIV.HilbertSpaces", "LRA.Analysis.FunctionalAnalysis.HilbertSpaces"),
    ("LRA.VolumeIV.InnerProductSpaces", "LRA.Analysis.FunctionalAnalysis.InnerProductSpaces"),
    ("LRA.VolumeIV.NormedLinearSpaces", "LRA.Analysis.FunctionalAnalysis.NormedLinearSpaces"),
    ("LRA.VolumeIV.MathematicalSpaces", "LRA.Internal.MathematicalSpaces"),
    ("LRA.VolumeIV.MeasurableSpaces", "LRA.Analysis.MeasureTheory.MeasurableSpaces"),
    ("LRA.VolumeIV.MeasureSpaces", "LRA.Analysis.MeasureTheory.MeasureSpaces"),
    ("LRA.VolumeIV.MetricSpaces", "LRA.Analysis.MetricSpaces"),
    ("LRA.VolumeIV.Models", "LRA.Logic.ModelTheory"),
    ("LRA.VolumeIV.TopologicalSpaces", "LRA.Topology"),
    ("LRA.VolumeIV.VectorSpaces", "LRA.LinearAlgebra"),
    ("LRA.VolumeIV", "LRA.Analysis.MetricSpaces"),
    ("LRA.VolumeVI.AbstractAlgebra", "LRA.Algebra"),
    ("LRA.VolumeVI.LinearAlgebra", "LRA.LinearAlgebra"),
    ("LRA.VolumeVII.WithMathlib", "LRA.Interop.Mathlib"),
    ("LRA.VolumeVII", "LRA.Interop.Mathlib"),
]


def rewrite(path: Path) -> bool:
    original = path.read_text(encoding="utf-8")
    lines = []
    for line in original.splitlines(keepends=True):
        if line.lstrip().startswith("import "):
            lines.append(line)
            continue
        for old, new in REPLACEMENTS:
            line = line.replace(old, new)
        lines.append(line)
    updated = "".join(lines)
    if updated == original:
        return False
    path.write_text(updated, encoding="utf-8", newline="")
    return True


def main() -> None:
    changed = []
    for base in (ROOT / "LRA", ROOT / "test"):
        for path in sorted(base.rglob("*.lean")):
            if rewrite(path):
                changed.append(path.relative_to(ROOT).as_posix())
    print(f"rewrote {len(changed)} Lean files")


if __name__ == "__main__":
    main()
