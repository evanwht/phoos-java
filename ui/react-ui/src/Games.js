import React, { Component } from 'react';
import Table from 'react-bootstrap/Table';
import Container from 'react-bootstrap/Container';
import Button from 'react-bootstrap/Button';
import API from './api';

export class GamesTable extends Component {
    constructor(props) {
        super(props)
        this.state = {
            games: [
                { 
                    id: 1, 
                    played: {
                        epochSecond: "07-04-2021"
                    }, 
                    team1: {
                        defense: {
                            id: 1,
                            name: 'Evan White'
                        },
                        offense: {
                            id: 2,
                            name: 'Thomas Mckenna'
                        }
                    },
                    team2: {
                        defense: {
                            id: 3,
                            name: 'Zach Volz'
                        },
                        offense: {
                            id: 4,
                            name: 'Manny Shahugan'
                        }
                    },
                    team1HalfScore: 5, 
                    team2HalfScore: 3, 
                    team1FinalScore: 10, 
                    team2FinalScore: 6 
                }
            ]
        }
    }

    componentDidMount() {
        API.get('games')
        .then(res => {
            const games = res.data;
            this.setState({ games });
        });
    }

    buildEditButton() {
        return (
            <Button variant="outline-warning" block>Edit</Button>
        )
    }

    renderTableData() {
        return this.state.games.map((game, index) => {
            const { id, played, team1, team2, team1HalfScore, team2HalfScore, team1FinalScore, team2FinalScore } = game;
            const team_1 = team1.defense.name + " - " + team1.offense.name;
            const team_2 = team2.defense.name + " - " + team2.offense.name;
            const half_scores = team1HalfScore + " - " + team2HalfScore;
            const final_scores = team1FinalScore + " - " + team2FinalScore;
            const winners = team1FinalScore > team2FinalScore ? team_1 : team_2;
            const losers = team1FinalScore > team2FinalScore ? team_2 : team_1;
            return (
                <tr key={id}>
                    <td className="align-middle">{new Date(played.epochSecond * 1000).toDateString()}</td>
                    <td className="align-middle winners">{winners}</td>
                    <td className="align-middle losers">{losers}</td>
                    <td className="align-middle">{half_scores}</td>
                    <td className="align-middle">{final_scores}</td>
                    <td className="align-middle">{this.buildEditButton()}</td>
                </tr>
            )
        })
    }

    render() {
        console.log("hello");
        return (
            <Container className="pt-4">
                <Table className="undernav App" size="sm" striped bordered hover variant="dark">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Winners</th>
                            <th>Losers</th>
                            <th>Half Time</th>
                            <th>Final</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                        {this.renderTableData()}
                    </tbody>
                </Table>
            </Container>
        );
    }
}
