import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EllipticCurvesCanonicalLaneLean

structure EllipticCurveModel (K : Type) [Field K] where
  a₁ : K
  a₂ : K
  a₃ : K
  a₄ : K
  a₆ : K

def discriminant {K : Type} [Field K] (E : EllipticCurveModel K) : K := by
  let b₂ := E.a₁ ^ 2 + 4 * E.a₂
  let b₄ := 2 * E.a₄ + E.a₁ * E.a₃
  let b₆ := E.a₃ ^ 2 + 4 * E.a₆
  let b₈ := E.a₁ ^ 2 * E.a₆ + 4 * E.a₂ * E.a₆ - E.a₁ * E.a₃ * E.a₄ + E.a₂ * E.a₃ ^ 2 - E.a₄ ^ 2
  -b₂ ^ 2 * b₈ - 8 * b₄ ^ 3 - 27 * b₆ ^ 2 + 9 * b₂ * b₄ * b₆

def jInvariant {K : Type} [Field K] (E : EllipticCurveModel K) : K := by
  let b₂ := E.a₁ ^ 2 + 4 * E.a₂
  let b₄ := 2 * E.a₄ + E.a₁ * E.a₃
  let Δ := discriminant E
  (b₂ ^ 2 - 24 * b₄) ^ 3 / Δ

structure WeierstrassClass (K : Type) [Field K] where
  curve : EllipticCurveModel K
  nonSingular : discriminant curve ≠ 0

def baseChange {K L : Type} [Field K] [Field L] (E : EllipticCurveModel K) (f : K →+* L) : EllipticCurveModel L :=
  { a₁ := f E.a₁, a₂ := f E.a₂, a₃ := f E.a₃, a₄ := f E.a₄, a₆ := f E.a₆ }

theorem discriminant_baseChange {K L : Type} [Field K] [Field L] (E : EllipticCurveModel K) (f : K →+* L) :
    discriminant (baseChange E f) = f (discriminant E) := by
  simp [discriminant, baseChange]

theorem jInvariant_baseChange {K L : Type} [Field K] [Field L] (E : EllipticCurveModel K) (f : K →+* L) :
    jInvariant (baseChange E f) = f (jInvariant E) := by
  simp [jInvariant, discriminant_baseChange]

end EllipticCurvesCanonicalLaneLean
end HautevilleHouse