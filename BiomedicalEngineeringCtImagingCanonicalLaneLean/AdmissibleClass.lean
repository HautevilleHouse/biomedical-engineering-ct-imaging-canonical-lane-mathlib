import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

structure CtAdmittedObject where
  imagingSystem : Type u
  reconstructionAlgorithm : Type v
  diagnosticTask : Prop
  conclusion : diagnosticTask

structure AdmissibleClass where
  object : CtAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CtWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def CtWitnessClosed (O : CtAdmittedObject) : Prop :=
  O.diagnosticTask

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse