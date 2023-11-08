module Main where

import A1
import A2
import A3
import A4
import A5


playWithEmptyBoard :: Player -> IO ()
playWithEmptyBoard = play _EMPTY_BOARD_


main :: IO ()
main = do
    startPlayer <- firstPlayer
    playWithEmptyBoard startPlayer
