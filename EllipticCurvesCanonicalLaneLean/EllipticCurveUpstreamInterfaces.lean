import EllipticCurvesCanonicalLaneLean.EllipticCurveAdmissibleClosure
import Mathlib.NumberTheory.EllipticCurve.MordellWeil
import Mathlib.NumberTheory.Height.EllipticCurve

namespace HautevilleHouse
namespace EllipticCurvesCanonicalLaneLean

noncomputable section

structure MordellWeilTheoremData (K : Type*) [Field K] [NumberField K] (W : WeierstrassCurve K) where
  rank : ℕ
  finiteGeneration : AddGroup.FG (MordellWeilGroup W)
  rankEquality : (rank : Cardinal) = module.rank ℤ (MordellWeilGroup W)

def MordellWeilTheoremStatement {K : Type*} [Field K] [NumberField K] {W : WeierstrassCurve K}
    (M : MordellWeilTheoremData K W) : Prop :=
  AddGroup.FG (MordellWeilGroup W) ∧
  (M.rank : Cardinal) = module.rank ℤ (MordellWeilGroup W)

theorem mordell_weil_theorem_from_data_checked {K : Type*} [Field K] [NumberField K]
    {W : WeierstrassCurve K} (M : MordellWeilTheoremData K W) :
    MordellWeilTheoremStatement M := by
  exact And.intro M.finiteGeneration M.rankEquality

structure HeightPairingData (K : Type*) [Field K] [NumberField K] (W : WeierstrassCurve K) where
  pairing : MordellWeilGroup W → MordellWeilGroup W → ℝ
  bilinear : BilinearForm ℝ (MordellWeilGroup W)
  nondegenerate : Nondegenerate

def HeightPairingTheoremStatement {K : Type*} [Field K] [NumberField K] {W : WeierstrassCurve K}
    (H : HeightPairingData K W) : Prop :=
  BilinearForm ℝ (MordellWeilGroup W) ∧ Nondegenerate

theorem height_pairing_from_data_checked {K : Type*} [Field K] [NumberField K]
    {W : WeierstrassCurve K} (H : HeightPairingData K W) :
    HeightPairingTheoremStatement H := by
  exact And.intro H.bilinear H.nondegenerate

end

end EllipticCurvesCanonicalLaneLean
end HautevilleHouse