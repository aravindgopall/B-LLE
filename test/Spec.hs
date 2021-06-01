import LLE.Advertising
import Test.Hspec
import Types.Advertising

main :: IO ()
main =
  hspec $ do
    describe "Advertising basic tests" $ do
      it "Should return expected value after converting to packet format" $ do
        (toBitForm $ APDUHeader ADV_SCAN_IND 1 1 32) `shouldBe` 13184
