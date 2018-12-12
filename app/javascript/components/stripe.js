// document.getElementsByClassName("stripe-button-el")[0].style.display = 'none';

// console.log("Je suis dans Stripe");

const paymentButton = document.querySelector(".stripe-button-el");
if (paymentButton) {
  console.log(paymentButton)
  const rentButton = document.querySelector("#rent-button");
  console.log(rentButton)
  rentButton.addEventListener("click", function(event) {
    event.preventDefault();
    paymentButton.click();
    console.log("je suis dans addEventListener");
  });
}
