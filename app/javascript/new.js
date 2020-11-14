function priceContent(){
  const itemPrice = document.getElementById('item-price')
  

  itemPrice.addEventListener("keyup", (e) => {
    const addTaxCalculation =  Math.floor (itemPrice.value * 0.1);
    const profitCalculation = itemPrice.value - addTaxCalculation;
    const addTaxPrice = document.getElementById('add-tax-price'); 
    const profit = document.getElementById('profit');
    
    addTaxPrice.innerHTML = `${ addTaxCalculation }`;
    profit.innerHTML = `${ profitCalculation }`;
});
}
if(document.URL.match('/items/new')){window.addEventListener('load', priceContent)}
