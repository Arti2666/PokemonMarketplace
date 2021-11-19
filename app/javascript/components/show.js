
const givePrice = () => {
  const hours = document.querySelector("#booking_amount")
  const price = document.querySelector("#price-set").dataset.price
  const priceSpan = document.querySelector("#price-span")

  if (hours) {
    hours.addEventListener('change', () => {
      console.log(hours.value)

      if (hours.value <= 10) {
        const calcul = hours.value * price;
        return priceSpan.innerText = `Total: ${calcul} €`;
      } else if ((hours.value > 10) && (hours.value <= 15)) {
        const calcul = (hours.value * price) * 0.9;
        return priceSpan.innerText = `Total: ${Math.ceil(calcul)} € / -10%`;
      } else {
        const calcul = (hours.value * price) * 0.8;
        return priceSpan.innerText = `Total: ${Math.ceil(calcul)} € / -20%`;
      }

    }
    )
  }

}


export { givePrice };
