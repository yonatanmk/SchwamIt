import 'babel-polyfill';
import 'whatwg-fetch';
import React from 'react';
import ReactDOM from 'react-dom';
import ReviewList from './components/ReviewList';
import ItemList from './components/ItemList';

$(function() {
  if (document.getElementById('ReviewList')) {
    ReactDOM.render(
      < ReviewList
      />,
      document.getElementById('ReviewList')
    );
  }
  if (document.getElementById('ItemList')) {
    ReactDOM.render(
      < ItemList
      />,
    document.getElementById('ItemList')
    );
  }
});
