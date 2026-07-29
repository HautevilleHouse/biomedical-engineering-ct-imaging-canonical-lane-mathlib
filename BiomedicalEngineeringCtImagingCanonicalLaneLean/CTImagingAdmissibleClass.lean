import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

structure CTImagingAdmissibleObject where
  scanObject : Type
  reconstructionAlgorithm : Type
  diagnosticMetric : Prop
  imageQualityMetric : Prop
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

structure CTAdmittedObject where
  object : CTImagingAdmissibleObject
  conclusion : object.imageQualityMetric

def CTWitnessClosed (O : CTAdmittedObject) : Prop :=
  O.conclusion

structure AdmissibleClass where
  object : CTAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CTWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse
