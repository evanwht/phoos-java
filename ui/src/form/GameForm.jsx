import React, { Component } from "react";
import Form from 'react-bootstrap/Form';
import FormLabel from 'react-bootstrap/FormLabel';
import Col from 'react-bootstrap/Col';
import Row from 'react-bootstrap/Row';
import Container from 'react-bootstrap/Container';
import API from "../api/api";
import UserForm from "./UserForm";
import AlertDismissable from "./AlertDismiss";
import { PlayerSelect } from "./PlayerSelect";

export class GameForm extends Component {
    constructor(props) {
        super(props)
        this.state = {
            p1: props.p1,
            p2: props.p2,
            p3: props.p3,
            p4: props.p4,
            t1h: props.t1h,
            t2h: props.t2h,
            t1f: props.t1f,
            t2f: props.t2f,
            players: [
                {
                    id: 1,
                    name: 'Evan White',
                    nickname: 'EZ'
                }
            ]
        }
        this.submit = this.submit.bind(this);
        this.change = this.change.bind(this);
        this.dismissAlert = this.dismissAlert.bind(this);
    }

    change = e => {
        const name = e.target.name;
        this.setState({ [name]: e.target.value });
    };

    dismissAlert() {
        this.setState({
            success: "",
            fail: ""
        });
    }

    renderAlert(success, fail) {
        if (success) {
            return (
                <AlertDismissable
                    variant="success"
                    heading="Success"
                    message={success}
                    dismiss={this.dismissAlert}
                />
            )
        } else if (fail) {
            return (
                <AlertDismissable
                    variant="danger"
                    heading="Error"
                    message={fail}
                    dismiss={this.dismissAlert}
                />
            )
        }
        return null;
    };

    submit = e => {
        e.preventDefault();
        const { p1, p2, p3, p4, t1h, t2h, t1f, t2f } = this.state;
        API.post('games', {
            played: Date,
            team1: {
                defense: {
                    id: parseInt(p1)
                },
                offense: {
                    id: parseInt(p2)
                }
            },
            team2: {
                defense: {
                    id: parseInt(p3)
                },
                offense: {
                    id: parseInt(p4)
                }
            },
            team1HalfScore: parseInt(t1h),
            team2HalfScore: parseInt(t2h),
            team1FinalScore: parseInt(t1f),
            team2FinalScore: parseInt(t2f)
        }).then(res => {
            this.setState({
                date: "",
                p1: "",
                p2: "",
                p3: "",
                p4: "",
                t1h: "",
                t2h: "",
                t1f: "",
                t2f: "",
                success: `Successfully created game`,
                fail: ""
            }, () => this.render())
        }).catch(reason => {
            this.setState({
                fail: "Could not create game. Please try again later.",
                success: ""
            }, () => this.render())
        });
    };

    playerSelections() {
        return (
            <Form.Group id="players">
                <h4 className="pt-3 text-white text-center">Positions</h4>
                <div class="d-md-block d-sm-none d-none">
                    <Row className="pad text-white">
                        <Col sm="2"></Col>
                        <Col>Defense</Col>
                        <Col>Offense</Col>
                    </Row>
                </div>
                <Form.Group id="team-1">
                    <Form.Row>
                        <Col sm="2">
                            <FormLabel className="text-white">Team 1</FormLabel>
                        </Col>
                        <PlayerSelect
                            value={this.state.p1}
                            name="p1"
                            position="Defense"
                            change={this.change}
                        />
                        <PlayerSelect
                            value={this.state.p2}
                            name="p2"
                            position="Offense"
                            change={this.change}
                        />
                    </Form.Row>
                </Form.Group>
                <Form.Group id="team-2">
                    <Form.Row>
                        <Col sm="2">
                            <FormLabel className="text-white">Team 2</FormLabel>
                        </Col>
                        <PlayerSelect
                            value={this.state.p3}
                            name="p3"
                            position="Defense"
                            change={this.change}
                        />
                        <PlayerSelect
                            value={this.state.p4}
                            name="p4"
                            position="Offense"
                            change={this.change}
                        />
                    </Form.Row>
                </Form.Group>
            </Form.Group>
        )
    }

    scoreSelections() {
        return (
            <Form.Group id="scores">
                <h4 className="pb-2 text-white text-center">Scores</h4>
                <Form.Group>
                    <Form.Row>
                        <Col className="pr-2">
                            <h5 className="pb-2 text-white text-center">Half</h5>
                            <Form.Row>
                                <Col>
                                    <FormLabel className="text-white text-center">Team 1</FormLabel>
                                    <Form.Control
                                        name="t1h"
                                        type="number"
                                        value={this.state.t1h}
                                        onChange={this.change}
                                        max={5} min={0} required
                                    />
                                </Col>
                                <Col xs="2">
                                    <FormLabel className="text-hide">suh</FormLabel>
                                    <p className="text-white text-center">__</p>
                                </Col>
                                <Col>
                                    <FormLabel className="text-white text-center">Team 2</FormLabel>
                                    <Form.Control
                                        name="t2h"
                                        type="number"
                                        value={this.state.t2h}
                                        onChange={this.change}
                                        max={5} min={0} required
                                    />
                                </Col>
                            </Form.Row>
                        </Col>
                        <Col className="pl-2">
                            <h5 className="pb-2 text-white text-center">Final</h5>
                            <Form.Row>
                                <Col>
                                    <FormLabel className="text-white text-center">Team 1</FormLabel>
                                    <Form.Control
                                        name="t1f"
                                        type="number"
                                        value={this.state.t1f}
                                        onChange={this.change}
                                        max={15} min={0} required
                                    />
                                </Col>
                                <Col xs="2">
                                    <FormLabel className="text-hide">suh</FormLabel>
                                    <p className="text-white text-center">__</p>
                                </Col>
                                <Col>
                                    <FormLabel className="text-white text-center">Team 2</FormLabel>
                                    <Form.Control
                                        name="t2f"
                                        type="number"
                                        value={this.state.t2f}
                                        onChange={this.change}
                                        max={15} min={0} required
                                    />
                                </Col>
                            </Form.Row>
                        </Col>
                    </Form.Row>
                </Form.Group>
            </Form.Group>
        )
    }

    render() {
        return (
            <Row>
                <Col sm="10" md="8" className="pl-0 pr-0 rounded bordered border-teal mx-auto">
                    <div className="bg-dark rounded-top border-teal bordered-bottom ">
                        <h3 className="pb-4 pt-4 text-white text-center">New Game</h3>
                    </div>
                    <Container>
                        {this.renderAlert(this.state.success, this.state.fail)}
                        <UserForm
                            submit={this.submit}
                            submitButtonText="Create"
                            elements={() => (
                                <React.Fragment>
                                    {this.playerSelections()}
                                    <hr className="mt-4 border-teal" />
                                    {this.scoreSelections()}
                                </React.Fragment>
                            )}
                        />
                    </Container>
                </Col>
            </Row>
        );
    }
}