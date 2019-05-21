module MyApp (runApp) where 

import Web.Scotty (scotty, get, notFound, text, param, json, rescue)

import qualified Services.BasicServices as BasicServices
import qualified Services.ImasServices  as ImasServices

textLn t = text $ t <> "\n"
rescueOr action a = action `rescue` (\_ -> return a)

routes = do
  -- Homepage
  get "/" $ do
    textLn $ BasicServices.homepage

  -- Echo words
  get "/echo/:words" $ do
    words <- param "words"
    textLn $ BasicServices.echo words

  -- Shout words
  get "/shout/:words" $ do
    words <- param "words"
    textLn $ BasicServices.shout words

  -- Production info
  get "/productions/:id" $ do
    pro <- param "id"
    textLn $ ImasServices.president pro

  -- Idols info
  get "/idols" $ do
    q <- param "q" `rescueOr` ""
    json $ ImasServices.findIdols q

  -- ERROR! 404 NOT FOUND
  notFound $ do
    textLn $ BasicServices.notFound

runApp = scotty 3000 $ routes
