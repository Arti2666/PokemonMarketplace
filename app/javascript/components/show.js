
const givePrice = () => {
  const hours = document.querySelector("#booking_amount")
  const price = document.querySelector("#price-set").dataset.price
  const priceSpan = document.querySelector("#price-span")
  const percentSpan = document.querySelector("#percent-span")

  if (hours) {
    hours.addEventListener('change', () => {
      console.log(hours.value)

      if (hours.value <= 10) {
        const calcul = hours.value * price;
        priceSpan.innerText = `Total: ${calcul} €`;
        percentSpan.innerText = ``;
      } else if ((hours.value > 10) && (hours.value <= 15)) {
        const calcul = (hours.value * price) * 0.9;
        priceSpan.innerText = `Total: ${Math.ceil(calcul)} € / `;
        percentSpan.innerText = `-10%`;
      } else {
        const calcul = (hours.value * price) * 0.8;
        priceSpan.innerText = `Total: ${Math.ceil(calcul)} € / `;
        percentSpan.innerText = `-20%`;
      }

    }
    )
  }

}


export { givePrice };
