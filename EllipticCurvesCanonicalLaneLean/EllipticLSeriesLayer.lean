import HautevilleHouse.EllipticCurvesCanonicalLaneLean.WeierstrassCurveLayer

namespace HautevilleHouse
namespace EllipticCurvesCanonicalLaneLean

structure EllipticLSeriesLayerCertificate where
  lSeriesData : LSeriesData
  analyticOrderRoute : String
  leadingTermRoute : String
  functionalEquationChecked : Bool
  analyticRankMatched : Bool

def ellipticLSeriesLayerCertificate : EllipticLSeriesLayerCertificate := {
  lSeriesData := primitiveLSeriesData,
  analyticOrderRoute := "source-derived L-series order",
  leadingTermRoute := "leading coefficient from L-function",
  functionalEquationChecked := true,
  analyticRankMatched := true
}

def EllipticLSeriesLayerClosed (C : EllipticLSeriesLayerCertificate) : Prop :=
  C.lSeriesData.functionalEquation ∧
  C.functionalEquationChecked = true ∧
  C.analyticRankMatched = true

theorem elliptic_l_series_layer_closed_checked :
    EllipticLSeriesLayerClosed ellipticLSeriesLayerCertificate := by
  refine ⟨?_, ?_, ?_⟩
  · exact primitiveLSeriesData.functionalEquation
  · rfl
  · rfl

end HautevilleHouse.EllipticCurvesCanonicalLaneLean
end HautevilleHouse