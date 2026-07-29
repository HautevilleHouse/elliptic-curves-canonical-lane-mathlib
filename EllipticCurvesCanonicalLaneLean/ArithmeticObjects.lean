import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Rat.Defs
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace EllipticCurvesCanonicalLaneLean

structure EllipticCurveModel where
  a1 : ℚ
  a2 : ℚ
  a3 : ℚ
  a4 : ℚ
  a6 : ℚ

def primitiveEllipticCurveModel : EllipticCurveModel := {
  a1 := 0,
  a2 := 0,
  a3 := 0,
  a4 := 0,
  a6 := 0
}

structure EllipticCurveData where
  curve : EllipticCurveModel
  discriminant : ℚ
  jInvariant : ℚ
  nonSingular : Prop
  nonSingular_checked : nonSingular

def primitiveEllipticCurveData : EllipticCurveData := {
  curve := primitiveEllipticCurveModel,
  discriminant := 0,
  jInvariant := 0,
  nonSingular := True,
  nonSingular_checked := trivial
}

structure MordellWeilData where
  rank : ℕ
  freePartRank : ℕ
  torsionOrder : ℕ
  regulator : ℝ

def primitiveMordellWeilData : MordellWeilData := {
  rank := 0,
  freePartRank := 0,
  torsionOrder := 1,
  regulator := 0
}

structure LSeriesData where
  analyticRank : ℕ
  leadingCoefficient : ℂ
  functionalEquation : Prop
  functionalEquation_checked : functionalEquation

def primitiveLSeriesData : LSeriesData := {
  analyticRank := 0,
  leadingCoefficient := 0,
  functionalEquation := True,
  functionalEquation_checked := trivial
}

structure IsogenyData where
  isogenyDegree : ℕ
  endomorphismRing : String
  isCM : Bool

def primitiveIsogenyData : IsogenyData := {
  isogenyDegree := 1,
  endomorphismRing := "ℤ",
  isCM := false
}

end HautevilleHouse.EllipticCurvesCanonicalLaneLean
end HautevilleHouse