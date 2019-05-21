module Services.ImasServices (president, findIdols) where

import Imas.Idol
import Imas.Production
import Data.Text.Lazy (Text)
import qualified Data.Text as TS

president :: Production -> Text
president P765 = "Takagi"
president P346 = "Mishiro"
president P315 = "Saitou"
president P283 = "Amai"

findIdols :: TS.Text -> Idols
findIdols q = search (makeQuery q) idols346

isMatch t Idol{..} = any (TS.isInfixOf t) [name, rubi]

makeQuery "" = id
makeQuery t  = filter (isMatch t)

search q is = Idols $ q is
