{-# LANGUAGE CPP #-}

module Main where

import Web.Slack
import Web.Slack.Message
import System.Environment (lookupEnv)
import Data.Maybe (fromMaybe)

myConfig :: String -> SlackConfig
myConfig apiToken = SlackConfig
         { _slackApiToken = apiToken
         }

echoBot :: SlackBot ()
echoBot (Message cid _ msg _ _ _) = sendMessage cid msg
echoBot _ = return ()

main :: IO ()
main = do
  let apiToken = "xoxp-PUT-TOKEN-HERE"
  runBot (myConfig apiToken) echoBot ()



