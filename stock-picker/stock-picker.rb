prices = [17,3,6,9,15,8,6,1,10]

# returns the max profit
def stock_picker (stock_prices)
  left = 0
  right = 1
  max_profit = 0

  while right < stock_prices.length - 1
    max_profit = [max_profit, stock_prices[right] - stock_prices[left]].max
    if (stock_prices[right] < stock_prices[left])
      left = right
    end
    right += 1
  end

  return max_profit
end

p(stock_picker(prices))