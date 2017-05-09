import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

// const addLoggingToDispatch = (store) => {
//   let daDispatch = store.dispatch;
//   return (action) => {
//     console.log(store.getState());
//     console.log(action);
//     daDispatch(action);
//     console.log(store.getState());
//   };
// };

const addLoggingToDispatch = store => next => action => {
  let daDispatch = store.dispatch;
  console.log(store.getState());
  console.log(action);
  daDispatch(action);
  console.log(store.getState());
  next(action);
};

let applyMiddlewares = (store, ...midwares) =>{
  let dispatch = store.dispatch;
  midwares.forEach((midware) =>{
    dispatch = midware(store)(dispatch);
  });

  return Object.assign({}, store, { dispatch });
};

// Now let's write an applyMiddlewares function that receives the store
 // and the list of middlewares as arguments:
//
// Create a variable dispatch, setting it equal to store.dispatch
// forEach middleware in the list of middlewares,
// Reassign dispatch to the result of middleware(store)(dispatch)
// Return Object.assign({}, store, { dispatch })

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);

  // store.dispatch = addLoggingToDispatch(store);
  store = applyMiddlewares(store, addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
