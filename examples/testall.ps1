cls
if (Test-Path "_testoutput.txt") { rm "_testoutput.txt" }
if (Test-Path "_AtomicTestErrors.txt") { rm "_AtomicTestErrors.txt" }

$compiled = @(
    @("AtomicTest.scala", "com/atomicscala/AtomicTest.class"),
    @("TheRoyalty.scala", "royals/Royalty.class"),
    @("ALibrary.scala", "com/yoururl/libraryname/x.class"),
    @("SodaFountain.scala", "sodafountain/IceCream.class"),
    @("Name.scala", "com/atomicscala/Name.class"),
    @("Compiled.scala", "WhenAmI.class"),
    @("CompiledWithArgs.scala", "EchoArgs.class"),
    @("CompiledWithMain.scala", "EchoArgs2.class"),
    @("PaintColors.scala", "paintcolors/Color.class"),
    @("ColorBlend.scala", "colorblend/package.class"),
    @("Errors.scala", "errors/Except1.class"),
    @("CodeListing.scala", "codelisting/CodeListing.class"),
    @("CodeListingTester.scala", "codelistingtester/CodeListingTester.class"),
    @("CodeListingEither.scala", "codelistingeither/CodeListingEither.class"),
    @("Fail.scala", "com/atomicscala/reporterr/FailMsg.class"),
    @("CodeListingCustom.scala", "codelistingcustom/CodeListingCustom.class"),
    @("CodeVector.scala", "codevector/CodeVector.class"),
    @("ElidingDBC.scala", "ElidingDBC.class"),
    @("Logging.scala", "com/atomicscala/Logging.class"),
    @("Quoting2.scala", "Quoting2/package.class"),
    @("Eratosthenes.scala", "primesieve/Eratosthenes.class")
)

fsc -reset

foreach($dependency in $compiled) {
    $source, $target = $dependency
    if(-Not(Test-Path $target)) {
        Write-Host fsc $source
        Write-Output "> fsc $source" | Out-File ./_testoutput.txt -append
        fsc $source 2>&1 | tee -Variable testout
        out-file ./_testoutput.txt -InputObject $testout -append
    } else {
        Write-Host $target already exists
        Write-Output "$target already exists" | Out-File ./_testoutput.txt -append
    }
}

$scripts = (
    "Values.scala",
    "Types.scala",
    "Expressions.scala",
    "If.scala",
    "If2.scala",
    "If3.scala",
    "If4.scala",
    "If5.scala",
    "BMI.scala",
    "EvaluationOrder.scala",
    "IntegerMath.scala",
    "CompoundExpressions1.scala",
    "CompoundExpressions2.scala",
    "CompoundExpressions3.scala",
    "CompoundBMI.scala",
    "MultiplyByTwo.scala",
    "AddMultiply.scala",
    "Animals.scala",
    "Hyena.scala",
    "Dog.scala",
    "Cat.scala",
    "Hamster.scala",
    "ImportClass.scala",
    "ImportMultiple.scala",
    "ImportSameLine.scala",
    "ImportCombined.scala",
    "ImportNameChange.scala",
    "ImportEverything.scala",
    "FullyQualify.scala",
    "ImportRoyalty.scala",
    "TestingExample.scala",
    "TDDFail.scala",
    "TDDStillFails.scala",
    "TDDWorks.scala",
    "Cup.scala",
    "Cup2.scala",
    "For.scala",
    "Vectors.scala",
    "TrueOrFalse.scala",
    "OneOrTheOther.scala",
    "CheckTruth.scala",
    "UseALibrary.scala",
    "UsingAtomicTest.scala",
    "BasicMethods.scala",
    "VectorCollection.scala",
    "CreatingClasses.scala",
    "Temperature.scala",
    "TicTacToe.scala",
    "ForVector.scala",
    "ForWithRanges.scala",
    "RangeShorthand.scala",
    "MatchExpressions.scala",
    "ClassArg.scala",
    "VisibleClassArgs.scala",
    "MultipleClassArgs.scala",
    "VariableClassArgs.scala",
    "NamedArguments.scala",
    "NamedAndDefaultArgs.scala",
    "Family.scala",
    "Overloading.scala",
    "OverloadingAdd.scala",
    "Coffee.scala",
    "GardenGnome.scala",
    "CaseClasses.scala",
    "StringInterpolation.scala",
    "ExpressionInterpolation.scala",
    "CaseClassInterpolation.scala",
    "ParameterizedTypes.scala",
    "ParameterizedReturnTypes.scala",
    "DisplayVector.scala",
    "DisplayVectorWithAnonymous.scala",
    "DisplayDuck.scala",
    "DisplayDuckTestable.scala",
    "TwoArgAnonymous.scala",
    "CallLater.scala",
    "AssignAnonymous.scala",
    "SimpleMap.scala",
    "Sum.scala",
    "Reduce.scala",
    "MoreReduce.scala",
    "Comprehension.scala",
    "Yielding.scala",
    "Yielding2.scala",
    "Yielding3.scala",
    "Yielding4.scala",
    "PatternMatchingWithTypes.scala",
    "PatternMatchingCaseClasses.scala",
    "Brevity1.scala",
    "Brevity2.scala",
    "Brevity3.scala",
    "Brevity4.scala",
    "Brevity5.scala",
    "Brevity6.scala",
    "Alias.scala",
    "MethodParentheses.scala",
    "Molecule.scala",
    "Swearing.scala",
    "Bicycle.scala",
    "Surrey.scala",
    "SurreyWithToString.scala",
    "ReturnBlob.scala",
    "Tuples.scala",
    "TupleUnpacking.scala",
    "CaseUnpack.scala",
    "ObjectsAndMethods.scala",
    "ThisKeyword.scala",
    "ObjectKeyword.scala",
    "CompanionObject.scala",
    "ObjectField.scala",
    "ObjectMethods.scala",
    "ObjCounter.scala",
    "FactoryMethod.scala",
    "GreatApe.scala",
    "GreatApe2.scala",
    "AuxiliaryInitialization.scala",
    "GreatApe3.scala",
    "Level.scala",
    "AbstractKeyword.scala",
    "AbstractClasses.scala",
    "AbstractAdder.scala",
    "Materials.scala",
    "TraitBodies.scala",
    "TraitInheritance.scala",
    "TraitCollision.scala",
    "Framework.scala",
    "UniformAccess.scala",
    "LinearRegression.scala",
    "Solid.scala",
    "Polymorphism.scala",
    "House1.scala",
    "House2.scala",
    "House3.scala",
    "House4.scala",
    "House5.scala",
    "AerobicExercise.scala",
    "TaggingTrait.scala",
    "Resilience.scala",
    "Constraint.scala",
    "MaltShoppe.scala",
    "SeqOperations.scala",
    "RecursivePrint.scala",
    "RecursiveSum.scala",
    "CollectionSums.scala",
    "Zipper.scala",
    "IndexWithZip.scala",
    "ZipMap.scala",
    "Sets.scala",
    "RemoveDuplicates.scala",
    "Maps.scala",
    "PetMap.scala",
    "ChangingAVal.scala",
    "AnUnchangingVar.scala",
    "References.scala",
    "ImmutableMaps.scala",
    "MutableMaps.scala",
    "ColorBlendTest.scala",
    "ColorBlendMap.scala",
    "DivZero.scala",
    "MultipleExceptions.scala",
    "CodeListingTest.scala",
    "DivZeroEither.scala",
    "MultiEitherErrors.scala",
    "ShowListingEither.scala",
    "EitherMap.scala",
    "Banded.scala",
    "BandedOption.scala",
    "ComprehensionOption.scala",
    "OptionOperations.scala",
    "OptionChaining.scala",
    "OptionMap.scala",
    "AddNewArguments.scala",
    "DivZeroTry.scala",
    "Try.scala",
    "TryRecover.scala",
    "PigInt.scala",
    "ContainerOfOne.scala",
    "TryTransform.scala",
    "IntPercent.scala",
    "Catching.scala",
    "TryComprehension.scala",
    "ShowListingTry.scala",
    "CustomErrors.scala",
    "FailMsgDemo.scala",
    "UsingFail.scala",
    "DivZeroCustom.scala",
    "ShowListingCustom.scala",
    "ShowCode.scala",
    "DesignByContract.scala",
    "LoggingTest.scala",
    "Quoting.scala",
    "Quote.scala",
    "ExtensionMethodArguments.scala",
    "Shape_Inheritance.scala",
    "Shape_TypeClass.scala"
)

foreach($script in $scripts) {
    Write-Host scala $script
    Write-Output "> scala $script" | Out-File ./_testoutput.txt -append
    scala -nocompdaemon $script 2>&1 | tee -Variable testout
    out-file ./_testoutput.txt -InputObject $testout -append
    Write-Output "--------------------" | Out-File ./_testoutput.txt -append
}

