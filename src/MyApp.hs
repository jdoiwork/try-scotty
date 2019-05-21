module MyApp (runApp) where 

import Web.Scotty (scotty, get, notFound, text, param, json, rescue)

import Imas.Idol
import Imas.Production

import qualified Services.BasicServices as Basic

textLn t = text $ t <> "\n"

routes = do
  -- Homepage
  get "/" $ text Basic.homepage

  -- Echo words
  get "/echo/:words" $ do
    words <- param "words"
    textLn $ Basic.echo words

  -- Shout words
  get "/shout/:words" $ do
    words <- param "words"
    textLn $ Basic.shout words

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

  notFound $ textLn Basic.notFound

runApp = scotty 3000 $ routes
