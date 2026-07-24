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
        "import LRA.VolumeVII.WithMathlib.MetricSpaces.MetricSpace",
        "import LRA.VolumeVII.WithMathlib.MetricSpaces.RealLineSpace",
        "import LRA.VolumeVII.WithMathlib.MetricSpaces.EuclideanSpace",
        "import LRA.VolumeVII.WithMathlib.MetricSpaces.DiscreteMetricSpace",
    ],
    ROOT / "LRA" / "VolumeVII" / "WithMathlib" / "MetricSpaces" / "MetricSpace.lean": [
        "import Mathlib.Data.Real.Basic",
        "structure Metric",
        "structure MetricSpace",
        "namespace MetricSpace",
    ],
    ROOT / "LRA" / "VolumeVII" / "WithMathlib" / "MetricSpaces" / "RealLineSpace.lean": [
        "import LRA.VolumeVII.WithMathlib.MetricSpaces.MetricSpace",
        "def realAbsoluteValueMetric",
        "def realMetricSpace",
    ],
    ROOT / "LRA" / "VolumeVII" / "WithMathlib" / "MetricSpaces" / "EuclideanSpace.lean": [
        "import LRA.VolumeVII.WithMathlib.MetricSpaces.MetricSpace",
        "noncomputable def realPlaneEuclideanMetric",
        "noncomputable def realPlaneMetricSpace",
    ],
    ROOT / "LRA" / "VolumeVII" / "WithMathlib" / "MetricSpaces" / "DiscreteMetricSpace.lean": [
        "import LRA.VolumeVII.WithMathlib.MetricSpaces.MetricSpace",
        "def discreteMetric",
        "def discreteMetricSpace",
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
