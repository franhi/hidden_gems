

function addTemporaryDates(){
const link = document.querySelector('#post_status');

link.addEventListener('change', (event) => {
  if (link.value == "temporary")
  {
    const unhide = document.querySelectorAll('.date');
    unhide.forEach(el => el.classList.remove('hide-date'));
  }  else {
       const unhide = document.querySelectorAll('.date');
    unhide.forEach(el => el.classList.add('hide-date'));
  }
})
}


export { addTemporaryDates };
