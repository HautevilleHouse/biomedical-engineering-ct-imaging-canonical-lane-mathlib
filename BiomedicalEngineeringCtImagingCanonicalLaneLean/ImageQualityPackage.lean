import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

structure ImageQualityPackage where
  spatialResolution : Prop
  contrastResolution : Prop
  noisePowerSpectrum : Prop
  artifactIndex : Prop
  signalToNoiseRatio : Prop

def ImageQualityClosed (Q : ImageQualityPackage) : Prop :=
  Q.spatialResolution ∧ Q.contrastResolution ∧ Q.noisePowerSpectrum ∧ Q.artifactIndex ∧ Q.signalToNoiseRatio

structure ImageQualityEvidence (Q : ImageQualityPackage) where
  spatialResolutionClosed : Q.spatialResolution
  contrastResolutionClosed : Q.contrastResolution
  noisePowerSpectrumClosed : Q.noisePowerSpectrum
  artifactIndexClosed : Q.artifactIndex
  signalToNoiseRatioClosed : Q.signalToNoiseRatio

theorem image_quality_closed_from_evidence (Q : ImageQualityPackage) (E : ImageQualityEvidence Q) :
    ImageQualityClosed Q := by
  exact And.intro E.spatialResolutionClosed
    (And.intro E.contrastResolutionClosed
      (And.intro E.noisePowerSpectrumClosed (And.intro E.artifactIndexClosed E.signalToNoiseRatioClosed)))

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse