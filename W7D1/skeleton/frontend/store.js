import { creatStore } from 'redux';
import reducer from './reducer.js';

let store = creatStore(reducer);

export default store;
