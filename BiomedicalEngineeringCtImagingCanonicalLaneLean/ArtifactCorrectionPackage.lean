import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

structure ArtifactCorrectionPackage where
  beamHardening : Prop
  scatterCorrection : Prop
  metalArtifactReduction : Prop
  ringArtifactRemoval : Prop
  motionCorrection : Prop

def ArtifactCorrectionClosed (A : ArtifactCorrectionPackage) : Prop :=
  A.beamHardening ∧ A.scatterCorrection ∧ A.metalArtifactReduction ∧ A.ringArtifactRemoval ∧ A.motionCorrection

structure ArtifactCorrectionEvidence (A : ArtifactCorrectionPackage) where
  beamHardeningClosed : A.beamHardening
  scatterCorrectionClosed : A.scatterCorrection
  metalArtifactReductionClosed : A.metalArtifactReduction
  ringArtifactRemovalClosed : A.ringArtifactRemoval
  motionCorrectionClosed : A.motionCorrection

theorem artifact_correction_closed_from_evidence (A : ArtifactCorrectionPackage) (E : ArtifactCorrectionEvidence A) :
    ArtifactCorrectionClosed A := by
  exact And.intro E.beamHardeningClosed
    (And.intro E.scatterCorrectionClosed
      (And.intro E.metalArtifactReductionClosed (And.intro E.ringArtifactRemovalClosed E.motionCorrectionClosed)))

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse