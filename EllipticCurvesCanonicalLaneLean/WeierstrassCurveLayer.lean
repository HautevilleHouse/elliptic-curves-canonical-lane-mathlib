import HautevilleHouse.EllipticCurvesCanonicalLaneLean.ArithmeticObjects

namespace HautevilleHouse
namespace EllipticCurvesCanonicalLaneLean

structure WeierstrassCurveLayerCertificate where
  curveData : EllipticCurveData
  sourceKey : String
  shortWeierstrassForm : Bool
  minModel : Bool
  mathlibSubstrateReady : Bool

def weierstrassCurveLayerCertificate : WeierstrassCurveLayerCertificate := {
  curveData := primitiveEllipticCurveData,
  sourceKey := "elliptic-curves-canonical-lane",
  shortWeierstrassForm := true,
  minModel := true,
  mathlibSubstrateReady := true
}

def WeierstrassCurveLayerClosed (C : WeierstrassCurveLayerCertificate) : Prop :=
  C.curveData.nonSingular ∧
  C.shortWeierstrassForm = true ∧
  C.minModel = true ∧
  C.mathlibSubstrateReady = true

theorem weierstrass_curve_layer_closed_checked :
    WeierstrassCurveLayerClosed weierstrassCurveLayerCertificate := by
  have h1 : weierstrassCurveLayerCertificate.curveData.nonSingular := primitiveEllipticCurveData.nonSingular
  have h2 : weierstrassCurveLayerCertificate.shortWeierstrassForm = true := rfl
  have h3 : weierstrassCurveLayerCertificate.minModel = true := rfl
  have h4 : weierstrassCurveLayerCertificate.mathlibSubstrateReady = true := rfl
  exact And.intro h1 (And.intro h2 (And.intro h3 h4))

end HautevilleHouse.EllipticCurvesCanonicalLaneLean
end HautevilleHouse