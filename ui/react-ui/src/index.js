import React from 'react';
import ReactDOM from 'react-dom';
// import './index.css';
import App from './App';
import { Navigation } from './Nav';
import {
  BrowserRouter,
  Switch,
  Route,
  Link
} from "react-router-dom";
import * as serviceWorker from './serviceWorker';
import 'bootstrap/dist/css/bootstrap.min.css';

ReactDOM.render(
  <BrowserRouter>
    <Navigation />
    <Switch>
      <Route path="/">
        <App />
      </Route>
      <Route path="/games">
        <App />
      </Route>
      <Route path="/new/game">
        <App />
      </Route>
      <Route path="/new/player">
        <App />
      </Route>
    </Switch>
  </BrowserRouter>,
  document.getElementById('root')
);

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
