def recursive_fibonacci(n=0)
    return [] if n==0
    return [0] if n==1
    inicio = [0,1]
    return inicio if n <=2
    fibonacci = recursive_fibonacci(n -1)
    fibonacci << fibonacci[(fibonacci.size)-2] + fibonacci.last
end
