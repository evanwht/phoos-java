import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import { StandingsTable } from './StandingsTable';
import { GamesTable } from './GamesTable';
import { Navigation } from './Nav';
import { PlayerForm } from './form/PlayerForm';
import { GameForm } from './form/GameForm';
import {
  HashRouter,
  Switch,
  Route
} from "react-router-dom";
import * as serviceWorker from './serviceWorker';
import 'bootstrap/dist/css/bootstrap.min.css';
import { Container } from 'react-bootstrap';

ReactDOM.render(
  <HashRouter>
    <Navigation />
    <Container className="undernav">
      <Switch>
        <Route path="/standings" exact component={StandingsTable} />
        <Route path="/games" exact component={GamesTable} />
        <Route path="/new/game" exact component={GameForm} />
        <Route path="/new/player" exact component={PlayerForm} />
        <Route path="/" exact component={App} />
      </Switch>
    </Container>
  </HashRouter>,
  document.getElementById('root')
);

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
