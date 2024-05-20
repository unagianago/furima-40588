const transactionInput = document.getElementById("item-price");
transactionInput.addEventListener("input", () => {
  const inputValue = transactionInput.value;

  const addTaxFee = document.getElementById("add-tax-price");
  addTaxFee.innerHTML = Math.floor(inputValue*0.1)

  const transactionProfit = document.getElementById("profit");
  transactionProfit.innerHTML = Math.floor(inputValue-addTaxFee.innerHTML)
})