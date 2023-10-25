module A4 where

import A1
import A2
import A3 hiding (
  _HEADER_,
  showSquares,
  dropFirstCol,
  dropLastCol,
  formatRows,
  isWinningLine,
  prependRowIndices
  )

-- *** Assignment 4-1 *** --

-- Q#01
-- Refactored _HEADER_ using map
_HEADER_ :: String
_HEADER_ = ' ' : concat (map show _RANGE_)
-- Q#02
-- Refactored showSquares using map
showSquares :: [Square] -> [String]
showSquares squares = map showSquare squares
-- Q#03
-- Refactored dropFirstCol using map
dropFirstCol :: Board -> Board
dropFirstCol board = map tail board
-- Q#04
-- Refactored dropLastCol using map
dropLastCol :: Board -> Board
dropLastCol board = map init board

--Q#05

-- Refactored formatRows using a lambda expression
formatRows :: [Row] -> [String]
formatRows = map (\row -> formatLine " " (showSquares row))

-- Q#06

-- New version of isWinningLine using filter
isWinningLine_ :: Player -> Line -> Bool
isWinningLine_ player line
  | null line = False  -- An empty line is not a winning line
  | otherwise = null (filter (== player) line)


-- *** Assignment 4-2 *** --

-- Q#07

isWinningLine = undefined

-- Q#08

hasWon = undefined

-- Q#09

getGameState = undefined


playMove = undefined

-- Q#10

prependRowIndices = undefined

-- Q#11

formatBoard = undefined