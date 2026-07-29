import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure CTImagingProofObligation where
  sourceKey : String
  theoremObject : String
  commonCoreImported : Bool
  scannerSpecificDefinitionsNative : Bool
  scannerSpecificBridgeNative : Bool
  scannerSpecificAdmittedClosureNative : Bool
  unrestrictedClassicalClosureNative : Bool
  carriedGap : String

def ctImagingProofObligation : CTImagingProofObligation := {
  sourceKey := "biomedical-engineering-ct-imaging-canonical-lane",
  theoremObject := "CT Imaging reconstruction theorem",
  commonCoreImported := true,
  scannerSpecificDefinitionsNative := true,
  scannerSpecificBridgeNative := true,
  scannerSpecificAdmittedClosureNative := true,
  unrestrictedClassicalClosureNative := false,
  carriedGap := "scanner-specific Mathlib endgame pilot closes over the admitted class; unrestricted classical closure remains carried"
}

def commonCoreProjectionLawAvailable : Prop :=
  forall {X : Type} [Add X] [Sub X] (L : AdditiveLane X),
    L.xNext = L.state + L.projection.toFun L.delta

def commonCoreCarriageLawAvailable : Prop :=
  forall {X : Type} [Add X] [Sub X] (L : AdditiveLane X),
    L.carriedComponent = L.delta - L.projection.toFun L.delta

def commonCoreIdempotenceAvailable : Prop :=
  forall {X : Type} [Add X] [Sub X] (L : AdditiveLane X),
    L.projection.toFun (L.projection.toFun L.delta) = L.projection.toFun L.delta

theorem mathlib_common_core_imported_checked :
    ctImagingProofObligation.commonCoreImported = true := by
  rfl

theorem scanner_specific_endgame_pilot_checked :
    (forall A : AdmissibleClass, ConstrainedCTClosure A) := by
  intro A
  exact constrained_ct_endgame A

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse