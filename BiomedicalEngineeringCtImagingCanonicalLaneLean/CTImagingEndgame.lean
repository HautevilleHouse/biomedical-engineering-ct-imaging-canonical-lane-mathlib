import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiomedicalEngineeringCtImagingCanonicalLaneLean.CTImagingBridgeLemmas

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

def ConstrainedCTClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_ct_endgame (A : AdmissibleClass) :
    ConstrainedCTClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse