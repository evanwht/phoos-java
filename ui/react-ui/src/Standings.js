import React, { Component } from 'react';
import Table from 'react-bootstrap/Table';
import Container from 'react-bootstrap/Container';
import Button from 'react-bootstrap/Button';

export class StandingsTable extends Component {
    constructor(props) {
        super(props)
        this.state = {
            standings: [
                { id: 1, name: 'Evan White', wins: 1, losses: 0, perc: 1.00 },
                { id: 2, name: 'Zach Volz', wins: 0, losses: 1, perc: 0.00 }
            ]
        }
    }

    renderTableData() {
        return this.state.standings.map((standing, index) => {
            const { id, name, wins, losses, perc } = standing
            return (
                <tr key={id}>
                    <td className="align-middle">{index + 1}</td>
                    <td className="align-middle">{name}</td>
                    <td className="align-middle">{wins}</td>
                    <td className="align-middle">{losses}</td>
                    <td className="align-middle">{perc}</td>
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
                            <th>Place</th>
                            <th>Player</th>
                            <th>Wins</th>
                            <th>Losses</th>
                            <th>Percentage</th>
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
