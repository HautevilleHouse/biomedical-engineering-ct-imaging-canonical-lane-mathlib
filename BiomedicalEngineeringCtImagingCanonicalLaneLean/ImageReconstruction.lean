import CTScannerModel

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

structure ImageReconstructionAlgorithm where
  projectionData : Type
  reconstructionMethod : Type
  filteredBackProjection : Prop
  iterativeReconstruction : Prop
  reconstructionRegularization : Prop
  imageQualityMetrics : Prop

structure ReconstructionEvidence (R : ImageReconstructionAlgorithm) where
  filteredBackProjectionClosed : R.filteredBackProjection
  iterativeReconstructionClosed : R.iterativeReconstruction
  reconstructionRegularizationClosed : R.reconstructionRegularization
  imageQualityMetricsClosed : R.imageQualityMetrics

def ReconstructionClosed (R : ImageReconstructionAlgorithm) : Prop :=
  R.filteredBackProjection ∧ R.iterativeReconstruction ∧
  R.reconstructionRegularization ∧ R.imageQualityMetrics

theorem reconstruction_closed_from_evidence (R : ImageReconstructionAlgorithm) (E : ReconstructionEvidence R) : ReconstructionClosed R :=
  And.intro E.filteredBackProjectionClosed (And.intro E.iterativeReconstructionClosed (And.intro E.reconstructionRegularizationClosed E.imageQualityMetricsClosed))

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse
