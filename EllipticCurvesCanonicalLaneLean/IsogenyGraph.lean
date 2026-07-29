import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EllipticCurvesCanonicalLaneLean.EllipticCurveModel

namespace HautevilleHouse
namespace EllipticCurvesCanonicalLaneLean

structure Isogeny (K : Type) [Field K] (E F : EllipticCurveModel K) where
  map : E → F
  isGroupHom : ∀ P Q : E, map (P + Q) = map P + map Q
  degree : ℕ
  separable : Bool
  kernel : Type
  sizeKernel : ℕ

def Isogeny.degreePos {K : Type} [Field K] {E F : EllipticCurveModel K} (φ : Isogeny K E F) : ℕ := φ.degree

def IsogenyGraph (K : Type) [Field K] : Type := List (EllipticCurveModel K × EllipticCurveModel K × ℕ)

structure EndomorphismRing (K : Type) [Field K] (E : EllipticCurveModel K) where
  addition : E → E → E
  multiplication : E → E → E
  identity : E
  zero : E
  isRing : ∀ a b c : E, (a + b) + c = a + (b + c) ∧
    a + b = b + a ∧
    a + zero = a ∧
    a + (-a) = zero ∧
    (a * b) * c = a * (b * c) ∧
    a * (b + c) = a * b + a * c ∧
    (a + b) * c = a * c + b * c

def supersingular (K : Type) [Field K] (E : EllipticCurveModel K) : Prop :=
  ∀ φ : EndomorphismRing K E, φ.zero = φ.identity → φ.zero = φ.identity

theorem isogeny_composition {K : Type} [Field K] {E F G : EllipticCurveModel K} (φ : Isogeny K E F) (ψ : Isogeny K F G) : Isogeny K E G := by
  refine { map := fun P => ψ.map (φ.map P), isGroupHom := ?_, degree := φ.degree * ψ.degree, separable := φ.separable ∧ ψ.separable, kernel := ?_, sizeKernel := ?_ }
  · intro P Q; simp [φ.isGroupHom, ψ.isGroupHom]
  · exact φ.kernel × ψ.kernel
  · exact φ.sizeKernel * ψ.sizeKernel

end EllipticCurvesCanonicalLaneLean
end HautevilleHouse