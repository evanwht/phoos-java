import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import { StandingsTable } from './Standings';
import { GamesTable } from './Games';
import { Navigation } from './Nav';
import { PlayerForm } from './PlayerForm';
import { GameForm } from './GameForm';
import {
  BrowserRouter,
  Switch,
  Route,
  useRouteMatch
} from "react-router-dom";
import * as serviceWorker from './serviceWorker';
import 'bootstrap/dist/css/bootstrap.min.css';

ReactDOM.render(
  <BrowserRouter>
    <Navigation />
    <Switch>
      <Route path="/standings" component={StandingsTable} />
      <Route path="/games" component={GamesTable} />
      <Route path="/new" component={New} />
      {/* <Route path="/new/player" component={PlayerForm} /> */}
      <Route path="/" component={App} />
    </Switch>
  </BrowserRouter>,
  document.getElementById('root')
);

function New() {
  let { path } = useRouteMatch();
  return (
    <Switch>
      <Route path={`${path}/game`} component={GameForm} />
      <Route path={`${path}/player`} component={PlayerForm} />
    </Switch>
  )
}

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
