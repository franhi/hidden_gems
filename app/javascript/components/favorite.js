function addRemoveFavorite(){

  document.querySelectorAll(".fa-heart").forEach((favorite) => {

    favorite.addEventListener('click', (event) => {
      if(favorite.classList.contains('far')) {
        favorite.classList.add('fas');
        favorite.classList.remove('far');
      } else {
        favorite.classList.add('far');
        favorite.classList.remove('fas');
      }
    });
  });
}
export { addRemoveFavorite };
