#!/usr/bin/env python3
"""Check that the Volume VII mathlib formalization track is wired into Lake."""

from __future__ import annotations

import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]

EXPECTED = {
    ROOT / "lakefile.lean": [
        "lean_lib LRAVolumeVII where\n  roots := #[`LRA.VolumeVII]",
    ],
    ROOT / "LRA" / "VolumeVII.lean": [
        "import LRA.VolumeVII.WithMathlib",
    ],
    ROOT / "LRA" / "VolumeVII" / "WithMathlib.lean": [
        "import LRA.VolumeVII.WithMathlib.MetricSpaces",
    ],
    ROOT / "LRA" / "VolumeVII" / "WithMathlib" / "MetricSpaces.lean": [
        "import LRA.VolumeVII.WithMathlib.MetricSpaces.MetricModeling",
        "import LRA.VolumeVII.WithMathlib.MetricSpaces.RealLineSpace",
        "import LRA.VolumeVII.WithMathlib.MetricSpaces.EuclideanSpace",
        "import LRA.VolumeVII.WithMathlib.MetricSpaces.DiscreteMetricSpace",
        "import LRA.VolumeVII.WithMathlib.MetricSpaces.MetricBalls",
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
    ROOT / "LRA" / "VolumeVII" / "WithMathlib" / "MetricSpaces" / "MetricBalls.lean": [
        "import Mathlib.Topology.MetricSpace.Basic",
        "theorem center_mem_ball",
        "theorem ball_subset_ball",
        "theorem ball_subset_closedBall",
        "theorem ball_subset_ball_of_mem",
    ],
}


def main() -> int:
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
        print("Volume VII wiring check failed:")
        for error in errors:
            print(f"  - {error}")
        return 1

    print("Volume VII wiring check passed.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
