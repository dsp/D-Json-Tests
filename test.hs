import Control.Applicative ((<$>), (<*>))
import Control.Monad
import Data.Aeson
import Data.Text (Text(..), pack, unpack)
import qualified Data.ByteString.Lazy as B

data Pull = Pull {
    title :: Text
    } deriving (Show)

instance FromJSON Pull where
    parseJSON (Object v) =
        Pull <$> v .: pack "title"
    parseJSON _ = mzero

main = do
    bstr <- (B.readFile "test.json")
    case (decode bstr :: Maybe [Pull]) of
        Just p -> mapM_
            (putStrLn . unpack . title)
            (concat $ take 100 $ repeat p)
        Nothing -> putStr "nothing"
