function price() {
  const inputPrice = document.getElementById("item-price");
  inputPrice.addEventListener("keyup", () => {
    const itemPrice = inputPrice.value;
    const priceTax = document.getElementById("add-tax-price");
    const commission = (itemPrice*1.1) - itemPrice;
    priceTax.innerHTML = Math.round(commission);

    const profit = document.getElementById("profit");
    profit.innerHTML = itemPrice - commission
  });
}

window.addEventListener('load', price);