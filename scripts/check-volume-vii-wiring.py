#!/usr/bin/env python3
"""Check that metric-space formalization is wired into the right volumes."""

from __future__ import annotations

import argparse
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]

EXPECTED = {
    ROOT / "lakefile.lean": [
        "lean_lib LRAVolumeIV where\n  roots := #[`LRA.VolumeIV]",
        "lean_lib LRAVolumeVII where\n  roots := #[`LRA.VolumeVII]",
    ],
    ROOT / "LRA" / "VolumeIV.lean": [
        "import LRA.VolumeIV.MetricSpaces",
    ],
    ROOT / "LRA" / "VolumeVII.lean": [
        "import LRA.VolumeVII.WithMathlib",
    ],
    ROOT / "LRA" / "VolumeVII" / "WithMathlib.lean": [
        "import LRA.VolumeVII.WithMathlib.MetricSpaces",
    ],
    ROOT / "LRA" / "VolumeIV" / "MetricSpaces.lean": [
        "import LRA.VolumeIV.MetricSpaces.Balls",
        "import LRA.VolumeIV.MetricSpaces.SetGeometry",
    ],
    ROOT / "LRA" / "VolumeVII" / "WithMathlib" / "MetricSpaces.lean": [
        "import LRA.VolumeVII.WithMathlib.MetricSpaces.MetricModeling",
        "import LRA.VolumeVII.WithMathlib.MetricSpaces.MetricSpace",
        "import LRA.VolumeVII.WithMathlib.MetricSpaces.RealLineSpace",
        "import LRA.VolumeVII.WithMathlib.MetricSpaces.EuclideanSpace",
        "import LRA.VolumeVII.WithMathlib.MetricSpaces.DiscreteMetricSpace",
    ],
    ROOT / "LRA" / "VolumeVII" / "WithMathlib" / "MetricSpaces" / "MetricModeling.lean": [
        "import Mathlib.Topology.MetricSpace.Basic",
        "structure ScratchMetric",
        "structure ScratchMetricSpace",
        "namespace ScratchMetricSpace",
    ],
    ROOT / "LRA" / "VolumeVII" / "WithMathlib" / "MetricSpaces" / "RealLineSpace.lean": [
        "import LRA.VolumeVII.WithMathlib.MetricSpaces.MetricModeling",
        "def realScratchMetric",
        "def realScratchMetricSpace",
    ],
    ROOT / "LRA" / "VolumeVII" / "WithMathlib" / "MetricSpaces" / "EuclideanSpace.lean": [
        "import LRA.VolumeVII.WithMathlib.MetricSpaces.MetricModeling",
        "lemma distance_eq_euclidean",
        "noncomputable def realPlaneScratchEuclideanMetric",
        "noncomputable def realPlaneScratchMetricSpace",
    ],
    ROOT / "LRA" / "VolumeVII" / "WithMathlib" / "MetricSpaces" / "DiscreteMetricSpace.lean": [
        "import LRA.VolumeVII.WithMathlib.MetricSpaces.MetricModeling",
        "def discreteScratchMetric",
        "def discreteScratchMetricSpace",
    ],
    ROOT / "LRA" / "VolumeIV" / "MetricSpaces" / "Balls" / "Basic.lean": [
        "import Mathlib.Topology.MetricSpace.Basic",
        "theorem center_mem_ball",
        "theorem ball_subset_ball",
        "theorem ball_subset_closedBall",
        "theorem ball_subset_ball_of_mem",
    ],
    ROOT / "LRA" / "VolumeIV" / "MetricSpaces" / "SetGeometry.lean": [
        "import LRA.VolumeIV.MetricSpaces.SetGeometry.Diameter",
        "import LRA.VolumeIV.MetricSpaces.SetGeometry.DistanceToSet",
    ],
}


def parse_args(argv: list[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Check that the metric-space formalization is wired into the expected Lean modules."
    )
    return parser.parse_args(argv)


def main(argv: list[str] | None = None) -> int:
    parse_args(argv)
    errors: list[str] = []

    for path, needles in EXPECTED.items():
        if not path.exists():
            errors.append(f"missing required file: {path.relative_to(ROOT)}")
            continue

        text = path.read_text(encoding="utf-8").replace("\r\n", "\n")
        for needle in needles:
            if needle not in text:
                errors.append(f"{path.relative_to(ROOT)} does not contain `{needle}`")

    if errors:
        print("Metric-space wiring check failed:")
        for error in errors:
            print(f"  - {error}")
        return 1

    print("Metric-space wiring check passed.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
