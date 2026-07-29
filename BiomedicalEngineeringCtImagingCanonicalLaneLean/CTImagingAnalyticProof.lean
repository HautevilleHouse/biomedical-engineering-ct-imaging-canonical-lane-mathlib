import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

structure ScannerGeometryCertificate (G : CTScannerGeometry) where
  detectorArrayGeometry : Prop
  xraySourceGeometry : Prop
  geometryCalibration : Prop
  detectorArrayGeometryClosed : detectorArrayGeometry
  xraySourceGeometryClosed : xraySourceGeometry
  geometryCalibrationClosed : geometryCalibration
  geometryEvidence : CTScannerGeometryEvidence G

def ScannerGeometryCertificateClosed (G : CTScannerGeometry) (C : ScannerGeometryCertificate G) : Prop :=
  C.detectorArrayGeometry ∧ C.xraySourceGeometry ∧ C.geometryCalibration ∧
  ScannerGeometryClosed G

theorem scanner_geometry_certificate_closed
    (G : CTScannerGeometry) (C : ScannerGeometryCertificate G) :
    ScannerGeometryCertificateClosed G C := by
  exact And.intro C.detectorArrayGeometryClosed
    (And.intro C.xraySourceGeometryClosed
      (And.intro C.geometryCalibrationClosed
        (scanner_geometry_closed_from_evidence G C.geometryEvidence)))

structure ReconstructionCertificate (R : ReconstructionPackage) where
  projectionDataSampling : Prop
  reconstructionKernel : Prop
  iterativeConvergence : Prop
  projectionDataSamplingClosed : projectionDataSampling
  reconstructionKernelClosed : reconstructionKernel
  iterativeConvergenceClosed : iterativeConvergence
  reconstructionEvidence : ReconstructionEvidence R

def ReconstructionCertificateClosed (R : ReconstructionPackage) (C : ReconstructionCertificate R) : Prop :=
  C.projectionDataSampling ∧ C.reconstructionKernel ∧ C.iterativeConvergence ∧
  ReconstructionClosed R

theorem reconstruction_certificate_closed
    (R : ReconstructionPackage) (C : ReconstructionCertificate R) :
    ReconstructionCertificateClosed R C := by
  exact And.intro C.projectionDataSamplingClosed
    (And.intro C.reconstructionKernelClosed
      (And.intro C.iterativeConvergenceClosed
        (reconstruction_closed_from_evidence R C.reconstructionEvidence)))

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse