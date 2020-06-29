import React, { Component } from 'react';
import Table from 'react-bootstrap/Table';
import Container from 'react-bootstrap/Container';
import Button from 'react-bootstrap/Button';

export class GamesTable extends Component {
    constructor(props) {
        super(props)
        this.state = {
            standings: [
                { id: 1, date: "07-04-2021", t1_d: 'Evan White', t1_o: 'Thomas Mckenna', t2_d: 'Zach Volz', t2_o: 'Manny Shahugan', t1_h: 5, t1_f: 10, t2_h: 3, t2_f: 6 },
                { id: 2, date: "07-05-2021", t1_d: 'Thomas Mckenna', t1_o: 'Zach Volz', t2_d: 'Evan White', t2_o: 'Manny Shahugan', t1_h: 3, t1_f: 7, t2_h: 5, t2_f: 10 }
            ]
        }
    }

    buildEditButton() {
        return (
            <Button variant="outline-warning" block>Edit</Button>
        )
    }

    renderTableData() {
        return this.state.standings.map((standing, index) => {
            const { id, date, t1_d, t1_o, t2_d, t2_o, t1_h, t1_f, t2_h, t2_f } = standing;
            const team_1 = t1_d + " - " + t1_o;
            const team_2 = t2_d + " - " + t2_o;
            const half_scores = t1_h + " - " + t2_h;
            const final_scores = t1_f + " - " + t2_f;
            const winners = t1_f > t2_f ? team_1 : team_2;
            const losers = t1_f > t2_f ? team_2 : team_1;
            return (
                <tr key={id}>
                    <td className="align-middle">{date}</td>
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
