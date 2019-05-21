module Imas.Production where

import Web.Scotty (Parsable, parseParam)

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
