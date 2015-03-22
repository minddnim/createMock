main :: IO()
main = do
  src <- readFile "../testSrc/test.c"
  let str = createMock src
  writeFile "testMock.c" str

createMock :: String -> String
createMock str = undefined
  