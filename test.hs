import Control.Monad
import Data.Aeson
import qualified Data.ByteString.Lazy as B

{- Generic Language extension -}
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
    mapM_ print (parsed bstr)
    where
        parsed bstr = map (\n -> decode bstr :: Maybe [Pull]) $ take 100 $ repeat 0
        print d = case d of
            Just p -> mapM_ (putStrLn . title) p
            Nothing -> putStr "can't parse test.json"
