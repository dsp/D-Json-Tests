import Control.Applicative ((<$>), (<*>))
import Control.Monad
import Data.Aeson
import Data.Text (Text(..), pack, unpack)
import qualified Data.ByteString.Lazy as B
import GHC.Generics (Generic)

{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

data Pull = Pull {
    title :: String
    } deriving (Show, Generic)

instance FromJSON Pull
instance ToJSON Pull

main = do
    bstr <- (B.readFile "test.json")
    case decode bstr :: Maybe [Pull] of
        Just p -> mapM_ (putStrLn . title) (concat $ take 100 $ repeat p)
        Nothing -> putStr "can't parse test.json"
