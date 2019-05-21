module Services.BasicServices where

import Data.Text.Lazy

homepage :: Text
homepage = "Hello scotty"

echo :: Text -> Text
echo = id

shout :: Text -> Text
shout = toUpper

notFound :: Text
notFound = "404 not found"
