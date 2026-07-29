import EllipticCurvesCanonicalLaneLean.EllipticCurveLayerCertificate

namespace HautevilleHouse
namespace EllipticCurvesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def ellipticAdmittedObject : AdmittedTheoremObject := {
  object := TheoremSpecificObject {
    sourceKey := "source-repository",
    theoremObject := "EllipticCurveAdmitted",
    claimBoundary := "Admissible class closure for elliptic curves."
  },
  localWitness := "Elliptic curve layer certificate with Weierstrass model, point group, and rank data.",
  bridgeEvidence := "Source-derived Lean certificate fields, reviewer bridge hashes, and Mathlib elliptic curve substrate.",
  sourceKeyChecked := rfl,
  theoremObjectChecked := rfl
}

def ellipticAdmissibleClass : AdmissibleClass := {
  object := ellipticAdmittedObject,
  endpointSatisfied := EllipticCurveLayerClosed ellipticCurveLayerCertificate,
  remainderRecorded := ClassicalSourceBoundaryCarried,
  gateWitness := Or.inl elliptic_curve_layer_closed_checked
}

def ConstrainedEllipticCurveClosure : Prop :=
  ConstrainedTheoremClosure ellipticAdmissibleClass

def EllipticCurveClassicalBoundaryCarried : Prop :=
  ClassicalSourceBoundaryCarried ∧ ellipticCurveLayerCertificate.closureWitness = "Elliptic curve layer certificate closed via bridge and gate."

theorem constrained_elliptic_curve_closure_checked :
    ConstrainedEllipticCurveClosure := by
  exact constrained_theorem_closure ellipticAdmissibleClass

theorem elliptic_classical_boundary_carried_checked :
    EllipticCurveClassicalBoundaryCarried := by
  exact And.intro classical_source_boundary_carried_checked rfl

end EllipticCurvesCanonicalLaneLean
end HautevilleHouse