import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

structure FilteredBackProjectionPackage where
  filterFunction : Prop
  backProjectionOperator : Prop
  reconstructionAccuracy : Prop
  computationEfficiency : Prop

structure FilteredBackProjectionEvidence (F : FilteredBackProjectionPackage) where
  filterFunctionClosed : F.filterFunction
  backProjectionOperatorClosed : F.backProjectionOperator
  reconstructionAccuracyClosed : F.reconstructionAccuracy
  computationEfficiencyClosed : F.computationEfficiency

def FilteredBackProjectionClosed (F : FilteredBackProjectionPackage) : Prop :=
  F.filterFunction ∧ F.backProjectionOperator ∧ F.reconstructionAccuracy ∧ F.computationEfficiency

theorem filtered_back_projection_closed_from_evidence (F : FilteredBackProjectionPackage) (E : FilteredBackProjectionEvidence F) : FilteredBackProjectionClosed F := by
  exact And.intro E.filterFunctionClosed (And.intro E.backProjectionOperatorClosed (And.intro E.reconstructionAccuracyClosed E.computationEfficiencyClosed))

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse