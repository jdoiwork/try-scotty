module MyApp (runApp) where 

import Web.Scotty (scotty, get, notFound, text, param, json, rescue)

import qualified Services.BasicServices as Basic
import qualified Services.ImasServices  as Imas

textLn t = text $ t <> "\n"
rescueOr action a = action `rescue` (\_ -> return a)

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
    textLn $ Imas.president pro

  -- Idols info
  get "/idols" $ do
    q <- param "q" `rescueOr` ""
    json $ Imas.findIdols q

  notFound $ textLn Basic.notFound

runApp = scotty 3000 $ routes
