module Services.BasicServices where

import Data.Text.Lazy

homepage :: FilePath
homepage = "public/index.html"

appJs :: FilePath
appJs = "public/app.js"

hello :: Text
hello = "Hello scotty"

echo :: Text -> Text
echo = id

shout :: Text -> Text
shout = toUpper

notFound :: Text
notFound = "404 not found"
