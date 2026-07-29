import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

structure ImagingModelPackage where
  sourceModel : Type u
  detectorModel : Type v
  attenuationLaw : Prop
  beamGeometry : Prop
  photonStatistics : Prop

def ImagingModelClosed (I : ImagingModelPackage) : Prop :=
  I.attenuationLaw ∧ I.beamGeometry ∧ I.photonStatistics

structure ImagingModelEvidence (I : ImagingModelPackage) where
  attenuationLawClosed : I.attenuationLaw
  beamGeometryClosed : I.beamGeometry
  photonStatisticsClosed : I.photonStatistics

theorem imaging_model_closed_from_evidence (I : ImagingModelPackage) (E : ImagingModelEvidence I) :
    ImagingModelClosed I := by
  exact And.intro E.attenuationLawClosed (And.intro E.beamGeometryClosed E.photonStatisticsClosed)

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse