import "bootstrap";


import { addTemporaryDates } from '../components/temporary_posts';

if(document.querySelector('#post_status')) {
addTemporaryDates();
}

import { SeeAllReviews } from '../components/hide_reviews';

if(document.querySelector("#myBtn")) {
SeeAllReviews();
}

import { addRemoveFavorite } from '../components/favorite';

if(document.querySelector(".fa-heart")) {
  addRemoveFavorite();
}
