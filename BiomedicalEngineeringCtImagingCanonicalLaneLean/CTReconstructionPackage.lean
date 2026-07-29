import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

structure CtScanGeometry where
  sourceDetectorDistance : ℝ
  numberOfDetectors : ℕ
  fanAngle : ℝ
  helicalPitch : ℝ
  geometryValid : Prop

structure AttenuationModel where
  linearAttenuationCoefficient : ℝ → ℝ → ℝ
  beamHardeningCorrection : Prop
  scatterEstimation : Prop

structure ProjectionAcquisition where
  projectionAngles : List ℝ
  raySum : ℝ → ℝ
  noiseModel : String
  photonStatistics : Prop

structure ReconstructionAlgorithm where
  algorithmName : String
  filterType : String
  cutoffFrequency : ℝ
  regularization : Prop

structure ImageQuality where
  spatialResolution : ℝ
  noiseLevel : ℝ
  contrastToNoiseRatio : ℝ
  artifactPresence : Prop
  clinicalAcceptability : Prop

structure CtReconstructionPackage where
  geometry : CtScanGeometry
  attenuation : AttenuationModel
  acquisition : ProjectionAcquisition
  algorithm : ReconstructionAlgorithm
  image : ImageQuality
  geometryValidClosed : geometry.geometryValid
  acquisitionCompleted : acquisition.photonStatistics
  algorithmApplied : Prop
  imageAcceptable : image.clinicalAcceptability
  reconstructionClosed : image.artifactPresence → image.clinicalAcceptability

structure CtReconstructionEvidence (C : CtReconstructionPackage) where
  geometryValidClosed : C.geometry.geometryValid
  acquisitionCompletedClosed : C.acquisition.photonStatistics
  algorithmAppliedClosed : C.algorithmApplied
  imageAcceptableClosed : C.image.clinicalAcceptability
  reconstructionClosedProof : C.reconstructionClosed C.image.artifactPresence

def CtReconstructionClosed (C : CtReconstructionPackage) : Prop :=
  C.geometry.geometryValid ∧ C.acquisition.photonStatistics ∧ C.algorithmApplied ∧ C.image.clinicalAcceptability

theorem ct_reconstruction_closed_from_evidence (C : CtReconstructionPackage)
    (E : CtReconstructionEvidence C) : CtReconstructionClosed C := by
  exact And.intro E.geometryValidClosed
    (And.intro E.acquisitionCompletedClosed
      (And.intro E.algorithmAppliedClosed E.imageAcceptableClosed))

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse