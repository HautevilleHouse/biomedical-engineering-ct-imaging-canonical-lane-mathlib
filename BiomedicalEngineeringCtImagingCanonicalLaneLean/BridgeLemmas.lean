import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CtWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse