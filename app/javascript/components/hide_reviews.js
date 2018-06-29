function SeeAllReviews(){
const link = document.querySelector("#myBtn");

 link.addEventListener('click', (event) => {
  let unhide = document.querySelectorAll("#reviews-list div");
  unhide.forEach( el =>  el.classList.toggle("hide-2"))
})
}
export { SeeAllReviews };
