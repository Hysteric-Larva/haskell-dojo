module A3 where

import A1
import A2

import Data.List (transpose)

-- *** Assignment 3-1 ***

-- Q#01

showInts :: [Int] -> [String]
showInts [] = []  -- Base case: an empty list results in an empty list of strings
showInts (x:xs) = show x : showInts xs  -- Convert the head of the list to a string and recursively process the tail



_HEADER_ :: String
_HEADER_ = formatLine " " (showInts _RANGE_)

-- Q#02

showSquares :: [Square] -> [String]
showSquares [] = []  -- Base case: an empty list results in an empty list of strings
showSquares (x:xs) = showSquare x : showSquares xs  -- Convert the head of the list to a string and recursively process the tail



-- Q#03

formatRows :: [Row] -> [String]
formatRows [] = []  -- Base case: an empty list results in an empty list of strings
formatRows (row:rows) = formatLine " " (showSquares row) : formatRows rows  -- Format the current row and recursively process the rest


-- Q#04

isColEmpty :: Row -> Int -> Bool
-- Base pattern 1: If the row is empty, no square is present, so return False
isColEmpty [] _ = False
-- Base pattern 2: If the index is 0 and the first square is empty, return True
isColEmpty (x:_) 0 = x == Empty
-- Recursive pattern: Check the rest of the row with a decremented index
isColEmpty (_:xs) col = isColEmpty xs (col - 1)


-- Q#05

-- Function to remove the first column from the board
dropFirstCol :: Board -> Board
dropFirstCol [] = []  -- Base case: An empty board remains empty
dropFirstCol (row:rows) = case row of
  [] -> []  -- Base case: An empty row remains empty
  (_:xs) -> xs : dropFirstCol rows  -- Remove the first square from the row and proceed to the next row

-- Function to remove the last column from the board
dropLastCol :: Board -> Board
dropLastCol [] = []  -- Base case: An empty board remains empty
dropLastCol rows = map init rows  -- Use `map` and `init` to remove the last square from each row


-- Q#06

type Diagonal = [Square]

-- Function to get the diagonal from top left to bottom right
getDiag1 :: Board -> Diagonal
getDiag1 [] = []  -- Base case: An empty board has an empty diagonal
getDiag1 (row:rows) = case row of
  [] -> []  -- Base case: An empty row has an empty diagonal
  (x:_) -> x : getDiag1 (map tail rows)  -- Get the first square and proceed to the next row by dropping the first column

-- Function to get the diagonal from top right to bottom left
getDiag2 :: Board -> Diagonal
getDiag2 [] = []  -- Base case: An empty board has an empty diagonal
getDiag2 rows = case last <$> rows of
  [] -> []  -- Base case: An empty row has an empty diagonal
  (x:_) -> x : getDiag2 (map init rows)  -- Get the last square and proceed to the next row by dropping the last column

type Line = [Square]

-- Function to get all lines from a board
getAllLines :: Board -> [Line]
getAllLines board = horizontalLines ++ verticalLines ++ diagonalLines
  where
    -- Horizontal lines are just the rows of the board
    horizontalLines = board

    -- Vertical lines can be obtained by transposing the board
    verticalLines = transpose board

    -- Diagonal lines
    diagonalLines = [getDiag1 board, getDiag2 board]

-- *** Assignment 3-2 ***

-- Q#07

putSquare = undefined

-- Q#08

prependRowIndices = undefined

-- Q#09

isWinningLine = undefined

-- Q#10

isValidMove = undefined