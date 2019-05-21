module MyApp (runApp) where 

import Web.Scotty (scotty, get, notFound, text, param, Parsable, parseParam, json, rescue)


import Imas.Idol

data Production = P765
                | P346
                | P315
                | P283
                  deriving (Show)

instance Parsable Production where
  parseParam "765" = Right P765
  parseParam "346" = Right P346
  parseParam "315" = Right P315
  parseParam "283" = Right P283
  parseParam _     = Left "Unknown production"



textLn t = text $ t <> "\n"

routes = do
  -- Homepage
  get "/" $ text "hello scotty"

  -- Echo words
  get "/echo/:words" $ do
    words <- param "words"
    textLn words

  -- Production info
  get "/productions/:id" $ do
    pro <- param "id"
    textLn $ case pro of
      P765 -> "Takagi"
      P346 -> "Mishiro"
      P315 -> "Saitou"
      P283 -> "Amai"

  -- Idol info
  get "/idols" $ do
    query <- makeQuery <$> param "q" `rescue` (\_ -> return "")
    json $ search query idols346

  notFound $ text "404 not found\n"

runApp = scotty 3000 $ routes
