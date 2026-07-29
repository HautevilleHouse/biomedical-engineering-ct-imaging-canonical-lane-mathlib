import CTImagingAdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

structure CTScannerModel where
  sourceGeometry : Type
  detectorGeometry : Type
  numberOfProjections : Nat
  energySpectrum : Type
  geometricCalibration : Prop
  detectorResponse : Prop
  sourceDetectorAlignment : Prop

structure CTScannerEvidence (M : CTScannerModel) where
  geometricCalibrationClosed : M.geometricCalibration
  detectorResponseClosed : M.detectorResponse
  sourceDetectorAlignmentClosed : M.sourceDetectorAlignment

def CTScannerClosed (M : CTScannerModel) : Prop :=
  M.geometricCalibration ∧ M.detectorResponse ∧ M.sourceDetectorAlignment

theorem ct_scanner_closed_from_evidence (M : CTScannerModel) (E : CTScannerEvidence M) : CTScannerClosed M :=
  And.intro E.geometricCalibrationClosed (And.intro E.detectorResponseClosed E.sourceDetectorAlignmentClosed)

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse
