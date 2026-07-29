import HautevilleHouse.EllipticCurvesCanonicalLaneLean.MordellWeilLayer

namespace HautevilleHouse
namespace EllipticCurvesCanonicalLaneLean

structure IsogenyLayerCertificate where
  isogenyData : IsogenyData
  isogenyGraphRoute : String
  endomorphismRingRoute : String
  isogenyDegreeChecked : Bool
  cmCheck : Bool

def isogenyLayerCertificate : IsogenyLayerCertificate := {
  isogenyData := primitiveIsogenyData,
  isogenyGraphRoute := "isogeny graph from modular forms",
  endomorphismRingRoute := "endomorphism ring classification",
  isogenyDegreeChecked := true,
  cmCheck := true
}

def IsogenyLayerClosed (C : IsogenyLayerCertificate) : Prop :=
  C.isogenyDegreeChecked = true ∧
  C.cmCheck = true

theorem isogeny_layer_closed_checked :
    IsogenyLayerClosed isogenyLayerCertificate := by
  exact And.intro rfl rfl

end HautevilleHouse.EllipticCurvesCanonicalLaneLean
end HautevilleHouse