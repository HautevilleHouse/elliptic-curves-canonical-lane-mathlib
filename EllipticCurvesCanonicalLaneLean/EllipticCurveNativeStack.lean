import EllipticCurvesCanonicalLaneLean.EllipticCurveUpstreamInterfaces

namespace HautevilleHouse
namespace EllipticCurvesCanonicalLaneLean

noncomputable section

structure EllipticCurveNativeStack (K : Type*) [Field K] [NumberField K] (W : WeierstrassCurve K) where
  curve : W
  mordellWeilData : MordellWeilTheoremData K W
  heightData : HeightPairingData K W
  torsionOrder : ℕ
  tamagawaProduct : ℂ
  closureEvidence : ConstrainedEllipticCurveClosure
  classicalBoundary : EllipticCurveClassicalBoundaryCarried

def EllipticCurveNativeStackStatement {K : Type*} [Field K] [NumberField K] {W : WeierstrassCurve K}
    (S : EllipticCurveNativeStack K W) : Prop :=
  MordellWeilTheoremStatement S.mordellWeilData ∧
  HeightPairingTheoremStatement S.heightData ∧
  ConstrainedEllipticCurveClosure ∧
  EllipticCurveClassicalBoundaryCarried

theorem elliptic_curve_native_stack_connects_components_checked {K : Type*} [Field K] [NumberField K]
    {W : WeierstrassCurve K} (S : EllipticCurveNativeStack K W) :
    EllipticCurveNativeStackStatement S := by
  exact And.intro (mordell_weil_theorem_from_data_checked S.mordellWeilData)
    (And.intro (height_pairing_from_data_checked S.heightData)
    (And.intro S.closureEvidence S.classicalBoundary))

end

end EllipticCurvesCanonicalLaneLean
end HautevilleHouse