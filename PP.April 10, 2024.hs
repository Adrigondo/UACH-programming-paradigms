-- This function sum 2 integers
_sum::Integer->Integer->Integer

_sum para1 para2 = para1 + para2

-- Main function
main::IO()
main = do
    let response = _sum 10 20 
    putStrLn ("The response is "++ show response )

main2::IO()
main2=
    putStrLn ("The response is "++ show (_sum 10 20) )

