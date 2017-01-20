import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import ReviewList from './components/ReviewList';

$(function() {
  ReactDOM.render(
    < ReviewList
    />,
    document.getElementById('ReviewList')
  );
});
