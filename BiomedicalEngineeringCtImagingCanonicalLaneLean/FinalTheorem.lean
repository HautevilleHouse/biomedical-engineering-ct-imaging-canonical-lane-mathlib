import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.BridgeLemmas
import canonicalLaneMathlib.GateLemmas

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

def ConstrainedCtImagingClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_ct_imaging_endgame (A : AdmissibleClass) :
    ConstrainedCtImagingClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse