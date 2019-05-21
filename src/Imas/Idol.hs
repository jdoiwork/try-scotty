module Imas.Idol where

import Data.Text (Text, isInfixOf)
import GHC.Generics
import Data.Aeson (ToJSON)

data Idol = Idol
  { name :: Text
  , rubi :: Text
  } deriving (Show, Generic)

instance ToJSON Idol

data Idols = Idols
  { idols :: [Idol]
  } deriving (Show, Generic)

instance ToJSON Idols

idols346 =
  [ Idol "辻野あかり" "つじのあかり"
  , Idol "砂塚あきら" "すなづかあきら"
  , Idol "夢見りあむ" "ゆめみりあむ"
  ]

